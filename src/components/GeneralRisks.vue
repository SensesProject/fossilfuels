<template>
  <div class="bubbles">
    <svg>
        <line
        v-for="(single,i) in createDots[0].singleDots"
        v-bind:key="i"
        stroke="black"
        :x1="single.horizontal"
        y1="100"
        :x2="single.horizontal"
        y2="600"
        />
      <g v-for="(dot,i) in createDots" v-bind:key="i" :id="dot.label">
      <circle
      v-for="(single, i) in dot.singleDots"
      v-bind:key="i"
      :class="dot.label"
      :r="single.single"
      :cx="single.horizontal"
      :cy="dot.vertical"/>
    </g>
   </svg>
  </div>
</template>

<script>
import * as d3 from 'd3'
import _ from 'lodash'

import PrEnQuantity from '../assets/data/PrimaryEnergyQuantity.json'
export default {
  name: 'GeneralRisks',
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
      return 900 / 5
    },
    groupData () {
      const primaryenergy = this.PrEnQuantity
      return _.groupBy(primaryenergy, 'scenario')
    },
    transformData () {
      let obj = {}
      _.forEach(this.groupData, (scenario, s) => {
        let scenObj = {}
        _.forEach(scenario, (energy, e) => {
          const data = _.map(energy)
          const label = energy['variable']
          scenObj[label] = data.splice(0, 16)
        })
        obj[s] = scenObj
      })
      return obj
    },
    selectData () {
      const data = this.transformData
      return data['NPi2020_400_V3']
    },
    scale () {
      return d3.scaleLinear()
        .range([0, 800])
    },
    createDots () {
      const selecteddata = this.selectData
      const scale = this.scale
      const arrayData = _.forEach(selecteddata, (energy, e) => { d3.values(energy) })
      let initDist = 50
      console.log(this.svgWidth)

      const dots = _.map(selecteddata, (energy, e) => {
        const dist = initDist
        initDist = dist + 150

        let initHorizontal = this.svgWidth
        if (this.step === 1) { initHorizontal = 50 }

        const singleDots = _.map(energy, (dot, d) => {
          const distHor = initHorizontal
          initHorizontal = distHor + 50
          return {
            single: scale.domain([0, d3.max(arrayData[e])])(Math.sqrt(dot)),
            horizontal: initHorizontal
          }
        })
        return {
          singleDots: this.step === 1 ? singleDots : [singleDots[0]],
          label: e,
          vertical: initDist
        }
      })
      console.log(dots)
      return dots
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "library/src/style/variables.scss";

.bubbles {
  margin: 0 auto;
  display: flex;
  position: sticky;
  max-width: 900px;
  width: 100%;
  height: 100vh;
}

svg {
  width: 100%;
  height: 100%;

  display: block;
  margin: 0 auto;

  circle {
    fill-opacity: 0.7;
  }

  line {
    stroke: getColor(gray, 50);
  }

  .primenCoal {
    fill: getColor(gray, 80);
    stroke: getColor(gray, 40);
  }

  .primenOil {
    fill: getColor(orange, 80);
    stroke: getColor(orange, 40);
  }

  .primenGas {
    fill: getColor(red, 80);
    stroke: getColor(red, 40);
  }
}
</style>
