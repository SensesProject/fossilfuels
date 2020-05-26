<template>
  <div class="second_graph">
    <div class="command">
      <p class="graph-title">Coal volume in EJ/year across scenarios</p>
        <div id="selection">
          Change region:
            <SensesSelect
            class="regionselect"
            :options='allRegions'
            v-model='region'/>
            <span class="model-label">REMIND-MAgPIE 1.7-3.0</span>
        </div>
        <img id="legend" src="../assets/img/coal-legend.svg"/>
     </div>
  <div class="coal">
            <svg ref="vis">
              <g :transform="'translate('+ margin.left + ',' + margin.top  + ')'">
                <rect class="bg" :width="chartWidth" :height="chartHeight" :class="{active: step > 6}"/>
                <g v-for="(path, i) in generateArea" v-bind:key="`${i}area`">
                  <path
                  class="area"
                  :d="path.area"
                  :fill="'#000'"
                  :class="{active: path.active}"
                  />
                </g>
                <g v-for="(path, i) in generateLine" v-bind:key="`${i}paths`">
                  <path
                  :d="path.singleLine"
                  :stroke="path.stroke[i]"
                  :class="path.id"
                  :id="path.active ? 'active' : 'inactive'"
                  />
                </g>
                <g v-for="(line, i) in transformData.axis" v-bind:key="`${i}axis`">
                  <text :x="scales.x(line)" :y="scales.y(0) + 20">{{ line }}</text>
                  <line
                    :x1="scales.x(line)"
                    :x2="scales.x(line)"
                    y1="0"
                    :y2="scales.y(0)"
                    stroke="black"
                  />
                  <line v-for="thick in axisThicks" v-bind:key="thick" class="thicks" :x1="0" :x2="scales.x(line)" :y1="scales.y(thick)" :y2="scales.y(thick)"/>
                  <text v-for="thick in axisThicks" v-bind:key="`${thick}-label`" class="thicks-labels" x="30" :y="scales.y(thick) - 5"> {{ thick }}EJ/yr</text>
                </g>
                <circle class="regActive" id="coal" :cx="scales.x(2005)" :cy="scales.y(transformData.firstValue)" r="5"/>
                <text class="coalValue coalNum" :x="scales.x(2004)" :y="scales.y(transformData.firstValue) + 15">
                  {{Math.round(transformData.firstValue)}} Ej/year
                </text>
                <GapElements
                  :scales="scales"
                  :data="{
                    valueLabel: valueLabel,
                    colorValue: colorValue,
                    transformData: transformData,
                    gapValue: gapValue,
                    step: step
                  }"/>
              </g>
           </svg>
  </div>
</div>
</template>

<script>
import * as d3 from 'd3'
import _ from 'lodash'

import PrEnQuantity from '../assets/data/PrimaryEnergyNpi2.json'

import GapElements from './subcomponents/GapElements.vue'
import SensesSelect from 'library/src/components/SensesSelect.vue'

export default {
  name: 'CoalRisk',
  components: {
    GapElements,
    SensesSelect
  },
  props: {
    step: {
      type: Number,
      default: 0
    },
    width: {
      type: Number,
      default: 0
    },
    height: {
      type: Number,
      default: 0
    }
  },
  data () {
    return {
      PrEnQuantity,
      colors: ['#4E40B2', '#e66b46', '#FFAC00', '#FFD682', '#f8ae98'],
      svgWidth: 0,
      svgHeight: 0,
      chartWidth: 0,
      chartHeight: 0,
      region: 'World'
    }
  },
  computed: {
    innerWidth () {
      const { width } = this
      return Math.min(width, 1000)
    },
    margin () {
      return {
        top: 65,
        left: 115,
        right: 170,
        bottom: 65
      }
    },
    groupData () {
      const primaryenergy = this.PrEnQuantity
      const groupRegion = _.groupBy(primaryenergy, 'Region')
      const groupVariable = _.groupBy(groupRegion[this.region], 'Variable')
      return groupVariable['primenCoal']
    },
    allRegions () {
      return _.uniq(_.map(this.PrEnQuantity, r => r['Region']))
    },
    transformData () {
      let obj = {}
      let lastValue = {}
      let max = []
      _.forEach(this.groupData, (scenario, s) => {
        let data = _.map(scenario, (energy, e) => { return [energy, e] })
        data.splice(6)
        let maxValue = d3.max(_.map(scenario, (energy, e) => { return energy }))
        max.push(maxValue)
        lastValue[scenario['Scenario']] = [scenario['2050'], scenario['Scenario']]
        obj[scenario['Scenario']] = [ data ]
      })
      console.log(obj)
      return {
        obj,
        max,
        firstValue: obj['Current Policies'][0][0][0],
        lastValue,
        axis: [2005, 2050]
      }
    },
    axisThicks () {
      const { max } = this.transformData
      return _.range(0, d3.max(max), 100)
    },
    scales () {
      const { max } = this.transformData
      const maxValue = max[0]
      return {
        x: d3
          .scaleLinear()
          .domain([2005, 2050])
          .rangeRound([0, this.chartWidth]),
        y: d3
          .scaleLinear()
          .domain([0, maxValue])
          .rangeRound([this.chartHeight, 0]),
        max: 461.855 + 100
      }
    },
    linePath () {
      return d3
        .line()
        .x(d => {
          return this.scales.x(d[1])
        })
        .y(d => {
          return this.scales.y(d[0])
        })
        .curve(d3.curveBasis)
    },
    generateLine () {
      const { obj } = this.transformData
      return _.map(obj, (line, l) => {
        const singleLine = _.map(line, values => {
          return this.linePath(values)
        })
        return {
          singleLine,
          id: l,
          stroke: this.colors,
          active: !!(this.step > 4 && l === 'Current Policies') ||
            !!(this.step > 6 && l === '2.0ºC') ||
            !!(this.step > 7 && l === '1.5ºC') ||
            !!(this.step > 6 && l === '2.0ºC Limited CDR') ||
            !!(this.step > 7 && l === '1.5ºC Limited CDR')
        }
      })
    },
    generateArea () {
      const { generateLine, chartWidth, chartHeight, step } = this
      return generateLine.map(l => {
        const y = l.id === 'Current Policies' ? 0 : chartHeight
        const area = l.singleLine[0].replace(/^M/, `M${chartWidth},${y}L0,${y},`)
        return {
          ...l,
          active: l.id !== '2.0ºC' || step <= 7,
          area
        }
      })
    },
    valueLabel () {
      const { lastValue } = this.transformData
      let current = lastValue['Current Policies']
      if (this.step === 7) { current = lastValue['2.0ºC'] }
      if (this.step === 8) { current = lastValue['1.5ºC'] }
      return current
    },
    gapValue () {
      const { lastValue } = this.transformData
      return lastValue['Current Policies'][0]
    },
    colorValue () {
      const colors = this.colors
      let color = colors[0]
      if (this.step === 7) { color = colors[1] }
      if (this.step === 8) { color = colors[2] }

      return color
    }
  },
  methods: {
    calcSizes: function () {
      const { vis: el } = this.$refs
      const svgWidth = el.clientWidth
      const svgHeight = el.clientHeight || el.parentNode.clientHeight
      this.svgWidth = Math.max(svgWidth, 500)
      this.svgHeight = Math.max(svgHeight, 500)
      this.chartWidth = Math.max(svgWidth, 500) - (this.margin.left + this.margin.right)
      this.chartHeight = Math.max(svgHeight, 500) - (this.margin.top + this.margin.bottom)
    }
  },
  mounted () {
    this.calcSizes()
    window.addEventListener('resize', this.calcSizes, false)
  },
  updated () {
    this.calcSizes()
  },
  beforeDestroy () {
    window.removeEventListener('resize', this.calcSizes, false)
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "library/src/style/variables.scss";

.second_graph {
  margin: 0 auto;
  padding-top: 10px;
  max-width: 1000px;
  width: 100%;
}

.dotted {
  width: 190px;
  display: inline;
  font-weight: normal;
}

.coal {
  margin: 0 auto;
  display: flex;
  max-width: 1000px;
  width: 100%;
  height: 100vh;
}

.command {
  font-weight: bold;
  margin: 0 auto;
  max-width: 900px;
  height: 80px;
  left: 0px;

  .graph-title {
    margin-right: 15px;
    display: inline-block;
  }

  .model-label {
    color: $color-neon;
    margin-top: 10px;
    width: 120px;
    font-weight: normal;
    margin-left: 5px;
  }

  #selection {
    margin-top: 20px;
    font-weight: normal;
    width: 90%;

    .regionselect {
      margin-left: 3px;
    }
  }

  #legend {
    display: inline-flex;
    margin-top: 20px;

    text {
      text-anchor: start;
    }
  }
}

svg {
  width: 100%;
  height: 80%;

  display: block;
  margin: 0 auto;

  // background-color: lightblue;
  line {
    stroke: black;
  }
  text {
    text-anchor: middle;
    transition: fill-opacity 0.5s;
  }

  .thicks {
    stroke: $color-gray;
    stroke-dasharray: 4 4;
  }

  .thicks-labels {
    font-size: 10px;
    fill: $color-gray;
  }

  path {
    fill: none;
    stroke-width: 3;
    transition: stroke-opacity 0.5s;

    &.CDR {
      stroke-width: 2.5;
    }

    &.area {
      fill: $color-white;
      opacity: 0;
      transition: opacity 0.5s;
      &.active {
        opacity: 1;
      }
    }
  }

  .bg {
    // fill: green;
    opacity: 0;
    transition: opacity 0.5s;
    fill: getColor(violet, 100);
    &.active {
      opacity: 1;
    }
  }

  #inactive {
    stroke-opacity: 0;
  }

  #active {
    stroke-opacity: 1;
  }

  .text-active {
    fill-opacity: 1;
  }

  .text-inactive {
    fill-opacity: 0;
  }

  #coal {
    fill: getColor(gray, 40);
    transition: cy 0.5s;
  }

  .coalValue {
    text-anchor: end;
  }

  .coalNum {
    fill: $color-accent;
  }

  .regInactive {
    fill: getColor(gray, 60);
    transition: fill-opacity 1s;
  }

  .Op {
    fill-opacity: 0.3;
  }

  .noOp {
    fill-opacity: 0;
  }

}

@media screen and (max-width: 1024px) {
#legend {
  width: 90%;
}
}
</style>
