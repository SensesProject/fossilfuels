<template>
  <div class="first_graph">
  <div class="command" v-if ="step < 3">
    Select a policy scenario: <br/>
    <SensesSelect
    :options='scenarioArray'
    v-model='selected'/>
   </div>
  <div class="bubbles">
    <svg>
      <linearGradient id="PriceRisk">
        <stop offset="0%" stop-color="#fcb69f"/>
        <stop offset="75%" stop-color="#fcb69f" stop-opacity="0.2"/>
      </linearGradient>
      <linearGradient id="UncRisk">
        <stop offset="0%" stop-color="#ed96ab"/>
        <stop offset="50%" stop-color="#ed96ab" stop-opacity="0"/>
      </linearGradient>
        <line
        v-for="(single, i) in createDots[0].singleDots"
        v-bind:key="i"
        stroke="black"
        :x1="single.horizontal"
        y1="50"
        :x2="single.horizontal"
        :y2="height - 150"
        />
        <text
        v-for="(single, i) in createDots[0].singleDots"
        v-bind:key="i"
        :x="single.horizontal"
        :y="height - 130"
        >{{ years[i] }}</text>
      <g v-for="(dot,i) in createDots" v-bind:key="i" :id="dot.label">
        <path
        v-bind:key="dot.shape"
        :d="dot.area"
        :class="[dot.label, step >= 3 ? 'paths_info' : '']"
        />
      <circle
      v-for="(single, i) in dot.singleDots"
      v-bind:key="i"
      :id="step >= 3 ? single.id : ''"
      :class="[dot.label, step >= 3 ? 'dots_info' : '']"
      :r="single.single"
      :cx="single.horizontal"
      :cy="single.vertical"/>
    </g>
   </svg>
  </div>
</div>
</template>

<script>
import * as d3 from 'd3'
import { area, curveCardinal } from 'd3-shape'
import numberToWords from 'number-to-words'
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
      return 900 / 9
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
      let selected = this.selected
      if (this.step === 3) { selected = 'NPi2020_400_V3' }
      const { obj } = this.transformData
      return obj[selected]
    },
    scale () {
      const { allValues } = this.transformData
      return d3.scaleLinear()
        .domain([0, d3.max(allValues)])
        .range([0, 2000])
    },
    drawArea () {
      return area()
        .curve(curveCardinal)
        .x((d) => {
          return d.horizontal
        })
        .y1((d) => {
          return d.y1
        })
        .y0((d) => {
          return d.y0
        })
    },
    createDots () {
      const selecteddata = this.selectData
      const scale = this.scale
      let initDist = 0

      return _.map(selecteddata, (energy, e) => {
        const dist = initDist
        initDist = dist + 160

        let initHorizontal = this.svgWidth

        const singleDots = _.map(energy, (dot, d) => {
          const distHor = initHorizontal
          initHorizontal = distHor + 45
          return {
            id: numberToWords.toWords(d),
            single: scale(Math.sqrt(dot)),
            vertical: initDist,
            horizontal: initHorizontal,
            y0: initDist - scale(Math.sqrt(dot)),
            y1: initDist + scale(Math.sqrt(dot))
          }
        })
        return {
          singleDots: this.step === 0 ? [singleDots[0]] : singleDots &&
          this.step === 1 | this.step >= 3 ? [singleDots[0], singleDots[15]] : singleDots,
          label: e,
          area: this.step === 1 | this.step >= 3
            ? this.drawArea([singleDots[0], singleDots[15]]) : this.drawArea(singleDots) &&
          this.step === 0 ? '' : this.drawArea(singleDots)
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

.first_graph {
  margin: 0 auto;
  max-width: 1000px;
  width: 100%;
}

.bubbles {
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

  circle {
    fill-opacity: 0.7;
  }

  path {
    fill-opacity: 0;
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

  .paths_info, .dots_info {
    fill-opacity: 1;
  }

}

#primenCoal {
      & > .paths_info {
        stroke-dasharray: 2;
        fill: white;
      }

      & > #fifteen {
        stroke-dasharray: 2;
        fill: white;
      }
}

#primenOil {
      & > .paths_info {
        fill: url(#PriceRisk);
      }

      & > #fifteen {
        fill: #fef0ec;
      }
}

#primenGas {
      & > .paths_info {
        fill: url(#UncRisk);
        // -webkit-filter: url("#glitch");
        // filter: url("/#glitch");
        // fill: url(#UncRisk);
        stroke: none;
        }

      & > #fifteen {
        opacity: 0;
      }

}
</style>
