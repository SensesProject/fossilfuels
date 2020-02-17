<template>
  <div class="third_graph">
  <div class="oil">
    <svg>

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
      margins: {
        marginleft: 65,
        marginright: 30
      }
    }
  },
  computed: {
    svgWidth () {
      return this.width - this.width / 2
    },
    chartHeight () {
      return this.height - this.height / 3
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
      const { max } = this.transformData
      return {
        x: d3
          .scaleLinear()
          .domain([2005, 2100])
          .rangeRound([0, this.svgWidth]),
        y: d3
          .scaleLinear()
          .domain([0, max[0] + 50])
          .rangeRound([this.chartHeight, 0]),
        max: max[0] + 100
      }
    },
    generateLine () {
      const { obj } = this.transformData
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
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "library/src/style/variables.scss";

.third_graph {
  margin: 0 auto;
  padding-top: 30px;
  max-width: 900px;
  width: 100%;
}

.oil {
  margin: 0 auto;
  display: flex;
  max-width: 1000px;
  width: 100%;
  height: 100vh;
}

svg {
  width: 100%;
  height: 100%;

  display: block;
  margin: 0 auto;

  background-color: lightblue;
}
</style>
