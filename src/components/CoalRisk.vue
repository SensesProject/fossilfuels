<template>
  <div class="second_graph">
    <div class="command">
      The production of coal will shrink when policies are implemented. <br/>
     </div>
  <div class="coal">
    <svg ref="vis">
      <g :transform="'translate('+ margin.left + ',' + margin.top + ')'">
        <g v-for="(line, i) in transformData.axis" v-bind:key="`${i}axis`">
          <text :x="scales.x(line)" :y="scales.y(0) + 20">{{ line }}</text>
          <line
            :x1="scales.x(line)"
            :x2="scales.x(line)"
            :y1="scales.y(transformData.max)"
            :y2="scales.y(0)"
            stroke="black"
          />
        </g>
        <g v-for="(path, i) in generateLine" v-bind:key="`${i}paths`">
          <text
          :x="scales.x(2050)"
          :y="path.labelPos"
          > {{ path.id }}
          </text>
          <path
          :d="path.singleLine"
          :stroke="path.stroke[i]"
          :id="path.active ? 'active' : 'inactive'"
          />
        </g>
        <circle id="coal" :cx="scales.x(2005)" :cy="scales.y(131.2274)" r="5"/>
        <GapElements
        :scales="scales"
        :data="{
        valueLabel: valueLabel,
        colorValue: colorValue,
        transformData: transformData,
        gapValue: gapValue,
        step: step
        }"
        />
      </g>
   </svg>
  </div>
</div>
</template>

<script>
import * as d3 from 'd3'
import _ from 'lodash'

import PrEnQuantity from '../assets/data/PrimaryEnergyQuantity.json'

import GapElements from './subcomponents/GapElements.vue'

export default {
  name: 'CoalRisk',
  components: {
    GapElements
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
      colors: ['#4E40B2', '#e66b46', '#FFAC00'],
      svgWidth: 0,
      svgHeight: 0,
      chartWidth: 0,
      chartHeight: 0
    }
  },
  computed: {
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
      const groupVariable = _.groupBy(primaryenergy, 'variable')
      return groupVariable['primenCoal']
    },
    transformData () {
      let obj = {}
      let lastValue = {}
      let max = []
      _.forEach(this.groupData, (scenario, s) => {
        let data = _.map(scenario, (energy, e) => { return [energy, e] })
        data.splice(16)
        let maxValue = d3.max(_.map(scenario, (energy, e) => { return energy }))
        max.push(maxValue)
        lastValue[scenario['scenario']] = [scenario['2100'], scenario['scenario']]
        obj[scenario['scenario']] = [ data ]
      })
      console.log(obj)
      return {
        obj,
        max,
        lastValue,
        axis: [2005, 2100]
      }
    },
    scales () {
      const { max } = this.transformData
      return {
        x: d3
          .scaleLinear()
          .domain([2005, 2100])
          .rangeRound([0, this.chartWidth]),
        y: d3
          .scaleLinear()
          .domain([0, max[0] + 50])
          .rangeRound([this.chartHeight, 0]),
        max: max[0] + 100
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
          labelPos: this.scales.y(line[0][8][0]),
          stroke: this.colors,
          active: !!(this.step > 4 && l === 'NPi_V3') ||
            !!(this.step > 6 && l === 'NPi2020_1000_V3') ||
            !!(this.step > 7 && l === 'NPi2020_400_V3')
        }
      })
    },
    valueLabel () {
      const { lastValue } = this.transformData
      let current = lastValue['NPi_V3']
      if (this.step === 7) { current = lastValue['NPi2020_1000_V3'] }
      if (this.step === 8) { current = lastValue['NPi2020_400_V3'] }
      return current
    },
    gapValue () {
      const { lastValue } = this.transformData
      return lastValue['NPi_V3'][0]
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
  height: 60px;
  left: 0px;

  .senses-select {
    margin: 10px auto;
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
  }

  path {
    fill: none;
    stroke-width: 3;
  }

  #inactive {
    stroke-opacity: 0;
  }

  #active {
    stroke-opacity: 1;
  }

  #coal {
    fill: getColor(gray, 40);
  }

}
</style>
