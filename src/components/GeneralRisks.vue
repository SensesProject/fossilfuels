<template>
  <div class="first_graph">
  <div class="command">
    <SensesSelect
    :options='scenarioArray'
    v-model='selected'/>
   </div>
  <div class="bubbles">
    <svg>
        <line
        v-for="(single, i) in createDots[0].singleDots"
        v-bind:key="i"
        stroke="black"
        :x1="single.horizontal"
        y1="100"
        :x2="single.horizontal"
        y2="650"
        />
        <text
        v-for="(single, i) in createDots[0].singleDots"
        v-bind:key="i"
        :x="single.horizontal"
        y="680"
        >{{ years[i] }}</text>
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
</div>
</template>

<script>
import * as d3 from 'd3'
import _ from 'lodash'

import PrEnQuantity from '../assets/data/PrimaryEnergyQuantity.json'

import SensesSelect from 'library/src/components/SensesSelect.vue'

export default {
  name: 'GeneralRisks',
  components: {
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
      years: [
        2005,
        2010,
        2015,
        2020,
        2025,
        2030,
        2035,
        2040,
        2045,
        2050,
        2055,
        2060,
        2070,
        2080,
        2090,
        2100],
      selected: 'NPi2020_400_V3'
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
      const allValues = []
      _.forEach(this.groupData, (scenario, s) => {
        let scenObj = {}
        _.forEach(scenario, (energy, e) => {
          const data = _.map(energy)
          const cleanData = data.splice(0, 16)
          const label = energy['variable']
          scenObj[label] = cleanData
          _.map(energy, (el, e) => { allValues.push(el) })
        })
        obj[s] = scenObj
      })
      return {
        obj,
        allValues: d3.values(allValues)
      }
    },
    scenarioArray () {
      const allScenario = []
      const { obj } = this.transformData

      _.forEach(obj, (arr, key) => {
        allScenario.push(key)
        return allScenario
      })
      return allScenario
    },
    selectData () {
      const selected = this.selected
      const { obj } = this.transformData
      return obj[selected]
    },
    scale () {
      const { allValues } = this.transformData
      return d3.scaleLinear()
        .domain([0, d3.max(allValues)])
        .range([0, 2000])
    },
    createDots () {
      const selecteddata = this.selectData
      const scale = this.scale
      // const arrayData = _.forEach(selecteddata, (energy, e) => { d3.values(energy) })
      let initDist = 0

      const dots = _.map(selecteddata, (energy, e) => {
        const dist = initDist
        initDist = dist + 180

        let initHorizontal = this.svgWidth

        const singleDots = _.map(energy, (dot, d) => {
          const distHor = initHorizontal
          initHorizontal = distHor + 45
          return {
            single: scale(Math.sqrt(dot)),
            horizontal: initHorizontal
          }
        })
        return {
          singleDots: this.step === 0 ? [singleDots[0]] : singleDots &&
          this.step === 1 ? [singleDots[0], singleDots[15]] : singleDots,
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

.first_graph {
  margin: 0 auto;
  max-width: 1000px;
  width: 100%;
}

.bubbles {
  margin: 0 auto;
  display: flex;
  position: sticky;
  max-width: 1000px;
  width: 100%;
  height: 100vh;
}

.command {
  margin: 0 auto;
  max-width: 600px;
  height: 30px;
  left: 0px;
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

  text {
    text-anchor: middle;
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
