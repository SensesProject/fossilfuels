<template>
  <div class="second_graph">
  <div class="coal">
    <svg ref="vis">
      <g :transform="'translate('+ margins.marginleft + ',30)'">
      <path
      v-for="(line,i) in generateLine"
      v-bind:key="i"
      :d="line.singleLine"
      :id="line.id"
      stroke="black"
      />
      <circle
      v-for="circle in transformData.lastValue"
      v-bind:key="circle[1]"
      :id="circle[1]"
      :cx="scales.x(2100)"
      :cy="scales.y(circle[0])"
      r="5px"/>
      <text :x="scales.x(2099)" :y="scales.y(valueLabel[0] + 10)">
        {{ valueLabel[0] + ' EJ/y'}}
        <tspan :x="scales.x(2099)" :y="scales.y(valueLabel[0] + 25)">
          Produced Coal
        </tspan>
      </text>
      <line
      :x1="scales.x(2005)"
      :x2="scales.x(2005)"
      :y2="scales.y(461.8547 + 100)"
      :y1="scales.y(-10)"
      />
      <line
      :x1="scales.x(2100)"
      :x2="scales.x(2100)"
      :y2="scales.y(461.8547 + 100)"
      :y1="scales.y(-10)"
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

export default {
  name: 'CoalRisk',
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
      svgWidth: 0,
      svgHeight: 0,
      chartWidth: 0,
      chartHeight: 0,
      margins: {
        marginleft: 100,
        marginright: 30,
        margintop: 100
      }
    }
  },
  computed: {
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
      return {
        obj,
        max,
        lastValue
      }
    },
    valueLabel () {
      const { lastValue } = this.transformData
      let current = lastValue['NPi_V3']
      if (this.step === 7) { current = lastValue['NPi2020_1000_V3'] }
      if (this.step === 8) { current = lastValue['NPi2020_400_V3'] }
      return current
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
    scales () {
      console.log('updating scales', this.svgWidth, this.svgHeight)
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
    generateLine () {
      const { obj } = this.transformData
      console.log('height somewhere else', this.svgHeight)
      return _.map(obj, (line, l) => {
        const singleLine = _.map(line, values => {
          return this.linePath(values)
        })
        return {
          singleLine,
          id: l
        }
      })
    }
  },
  methods: {
    calcSizes: function () {
      const { vis: el } = this.$refs
      const svgWidth = el.clientWidth
      const svgHeight = el.clientHeight || el.parentNode.clientHeight
      console.log('width', el.clientWidth)
      console.log('height', Math.max(svgHeight, 500))
      this.svgWidth = Math.max(svgWidth, 500)
      this.svgHeight = Math.max(svgHeight, 500)
      this.chartWidth = Math.max(svgWidth, 500) - this.margins.marginleft
      this.chartHeight = Math.max(svgWidth, 500) / this.margins.margintop
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
  padding-top: 30px;
  max-width: 900px;
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

  // display: block;
  margin: 0 auto;

  path {
    fill: none;
    stroke-width: 2px;
  }

  line {
    stroke-width: 0.5;
    stroke: black;
  }

  circle {
    fill-opacity: 0.5;
    fill: none;
    stroke-width: 2px;
  }

  #NPi_V3 {
    stroke: $color-red;
  }

  #NPi2020_1000_V3 {
    stroke: $color-yellow;
  }

  #NPi2020_400_V3 {
    stroke: getColor(green, 40);
  }
}
</style>
