<template>
  <div class="first_graph">
  <div class="command">
    <p class="graph-title" v-if="step < 3">Trends absolute volume of fossil fuels in climate policy scenarios</p>
    <p class="graph-title" v-if="step >= 3">We explore three types of risks: </p>
    <p class="highlight">REMIND-MAgPIE 1.7-3.0</p><br/>
    <div id="selection" v-show ="step > 1 && step < 3">
      Change scenario and/or region:
      <SensesSelect
    :options='scenarioArray'
    v-model='selected'/>
    <SensesSelect
    :options='allRegions'
    v-model='region'/>
    </div>
   </div>
  <div class="bubbles">
    <svg  ref="vis">
      <linearGradient id="PriceRisk">
        <stop offset="0%" stop-color="#fcb69f"/>
        <stop offset="75%" stop-color="#fcb69f" stop-opacity="0.2"/>
      </linearGradient>
      <linearGradient id="UncRisk">
        <stop offset="0%" stop-color="#ed96ab"/>
        <stop offset="50%" stop-color="#ed96ab" stop-opacity="0"/>
      </linearGradient>
      <g :transform="'translate(' + margin.left + '0)'">
        <line
        v-for="(single, i) in createDots[0].singleDots"
        v-bind:key="`${i}a`"
        stroke="black"
        :x1="single.horizontal"
        y1="50"
        :x2="single.horizontal"
        :y2="axisHeight - 150 + 'px'"
        />
        <text
        v-for="(single, i) in createDots[0].singleDots"
        v-bind:key="`${i}b`"
        :x="single.horizontal"
        :y="axisHeight - 130"
        >{{ step === 1 || step > 2 ? onlytwo[i] : all[i]}}</text>
      <g v-for="(dot,i) in createDots" v-bind:key="i" :id="dot.id">
        <path v-bind:key="'dot' + i"
        :d="dot.area"
        :class="[dot.id, step >= 3 ? 'paths_info' : '']"
        />
      <circle
      v-for="(single, i) in dot.singleDots"
      v-bind:key="'circle'  + i"
      :id="step >= 3 ? single.id : ''"
      :class="[dot.id, step >= 3 ? 'dots_info' : '']"
      :r="single.single"
      :cx="single.horizontal"
      :cy="single.vertical"/>
      <text
      v-bind:key="'label'  + i"
      :x="dot.singleDots[0]['horizontal'] - 80"
      :y="dot.singleDots[0]['vertical']"
      >
      {{ dot.label }}
    </text>
    <text
    v-if="step > 2"
    class="risk"
    :id="dot.id"
    v-bind:key="'risk'  + i"
    :x="dot.singleDots[1]['horizontal'] + 50"
    :y="dot.singleDots[1]['vertical']"
    >
      {{ dot.risks[i] }}
    </text>
    </g>
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

import PrEnQuantity from '../assets/data/PrimaryEnergyNpi.json'

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
      svgWidth: 0,
      svgHeight: 0,
      axisWidth: 0,
      axisHeight: 0,
      onlytwo: [
        2005,
        2100
      ],
      all: [
        2005,
        2010,
        2020,
        2030,
        2040,
        2050,
        2060,
        2070,
        2080,
        2090,
        2100],
      selected: '1.5ºC',
      region: 'World'
    }
  },
  computed: {
    margin () {
      return {
        left: 0,
        top: 0,
        right: 0,
        bottom: 0
      }
    },
    filterRegion () {
      const filter = _.groupBy(this.PrEnQuantity, 'Region')
      return filter[this.region]
    },
    groupData () {
      const primaryenergy = this.filterRegion
      return _.groupBy(primaryenergy, 'Scenario')
    },
    transformData () {
      let obj = {}
      const allValues = []
      _.forEach(this.groupData, (scenario, s) => {
        let scenObj = {}
        _.forEach(scenario, (energy, e) => {
          const data = _.map(energy)
          const cleanData = data.splice(0, 11)
          const label = energy['Variable']
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
    allRegions () {
      return _.uniq(_.map(this.PrEnQuantity, r => r['Region']))
    },
    selectData () {
      let selected = this.selected
      if (this.step > 2) { selected = '1.5ºC' }
      const { obj } = this.transformData
      return obj[selected]
    },
    scale () {
      return d3.scaleLinear()
        .domain([0, 441.699])
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
      let initDist = this.svgHeight / 6
      return _.map(selecteddata, (energy, e, energies) => {
        const dist = initDist
        if (e !== 'primenCoal') {
          initDist = dist + (this.svgHeight / energy.length) * 2.5
        }

        const singleDots = _.map(energy, (dot, d, dots) => {
          const horizontal = (this.axisWidth / dots.length) * d
          return {
            id: numberToWords.toWords(d),
            single: scale(Math.sqrt(dot)),
            vertical: initDist,
            horizontal,
            y0: initDist - scale(Math.sqrt(dot)),
            y1: initDist + scale(Math.sqrt(dot))
          }
        })
        return {
          singleDots: this.step === 0 ? [singleDots[0]] : singleDots &&
          this.step === 1 | this.step >= 3
            ? [singleDots[0], singleDots[10]] : singleDots,
          label: e.replace('primen', ''),
          id: e === 'primenNat. Gas' ? 'Gas' : e,
          risks: ['➔ Quantity Risk', '➔ Uncertainty Risk', '➔ Price Risk'],
          area: this.step === 1 | this.step >= 3
            ? this.drawArea([singleDots[0], singleDots[10]]) : this.drawArea(singleDots) &&
          this.step === 0
              ? '' : this.drawArea(singleDots)
        }
      })
    }
  },
  methods: {
    calcSizes: function () {
      const { vis: el } = this.$refs
      const svgWidth = el.clientWidth
      const svgHeight = el.clientHeight || el.parentNode.clientHeight
      this.svgWidth = Math.max(svgWidth, 500)
      this.svgHeight = Math.max(svgHeight, 500)
      this.margin.left = svgWidth / (svgWidth / 12)
      this.axisWidth = Math.max(svgWidth, 500) - (this.margin.left * 20)
      this.axisHeight = Math.max(svgHeight, 500) - (svgHeight / 18)
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

.first_graph {
  margin: 0 auto;
  max-width: 1000px;
  max-height: 900px;
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

  .graph-title {
    display: inline-block;
    margin-right: 15px;
  }

  .senses-select {
    margin: 10px 10px;
  }

  #selection {
    font-weight: normal;
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

  .Gas {
    fill: getColor(red, 80);
    stroke: getColor(red, 40);
  }

  .paths_info, .dots_info {
    fill-opacity: 1;
  }

  .risk {
    text-anchor: start;
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

#Gas {
      & > .paths_info {
        fill: url(#UncRisk);
        stroke: none;
        }

      & > #ten {
        opacity: 0;
      }

}
</style>
