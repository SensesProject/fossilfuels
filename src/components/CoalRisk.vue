<template>
  <div class="second_graph">
  <div class="coal">
    <svg>
      <g :transform="'translate(50, 30)'">
      <path
      v-for="(line,i) in generateLine"
      v-bind:key="i"
      :d="line.singleLine"
      :id="line.id"
      stroke="black"
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
      PrEnQuantity
    }
  },
  computed: {
    svgWidth () {
      return this.width / 2
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
      let max = []
      _.forEach(this.groupData, (scenario, s) => {
        let data = _.map(scenario, (energy, e) => { return [energy, e] })
        data.splice(16)
        let maxValue = d3.max(_.map(scenario, (energy, e) => { return energy }))
        max.push(maxValue)
        obj[scenario['scenario']] = [ data ]
      })
      console.log(obj)
      return {
        obj,
        max
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
        .curve(d3.curveLinear)
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
          .domain([0, max[0] + 100])
          .rangeRound([this.chartHeight, 0])
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
@media screen and (min-height: 700px) {
  svg {
    height: 50%;
  }
}

.second_graph {
  margin: 0 auto;
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
  height: 100%;

  display: block;
  margin: 0 auto;

  path {
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
