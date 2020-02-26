<template>
  <div class="oil-risk">
    <div class="wrapper" :style="{width: `${innerWidth}px`, height: `${height}px`}">
      <div class="key">
        <PriceLegend />
        <!-- Key <br>
        {{ svg.width }} x {{ svg.height }} -->
      </div>
      <div class="chart" v-resize:debounce.initial="onResize">
        <svg>
          <g :transform="`translate(${layout.margin.left} ${layout.margin.top})`">
            <g class="axis">
              <g class="x-axis">
                <g v-for="(y, i) in years" :key="`y-${i}`" :transform="`translate(${layout.colWidth * (i + 0.5)} 0)`">
                  <circle cy="-5" r="5"/>
                  <line :y2="layout.height"/>
                  <text :y="layout.height + layout.lineHeight">{{ y }}</text>
                </g>
              </g>
              <g class="y-axis">
                <g v-for="(s, i) in scenarios" :key="`s-${i}`" :transform="`translate(0 ${layout.rowHeight * (i + 0.5)})`">
                  <line :x2="layout.width - layout.colWidth * 0.5"/>
                  <text :x="-8" :y="4">{{ s }}</text>
                </g>
              </g>
            </g>
            <g class="boxes">
              <g v-for="(r, ri) in rows" :key="`r-${ri}`">
                <OilRiskBoxes v-for="(c, ci) in r" :key="`c-${ri}-${ci}`" :data="c" :size="layout.boxSize" :max="max"
                  :transform="`translate(${layout.colWidth * (ci + 0.5)} ${layout.rowHeight * (ri + 0.5)})`"/>
              </g>
            </g>
          </g>
        </svg>
      </div>
    </div>
  </div>
</template>

<script>
// import * as d3 from 'd3'
// import _ from 'lodash'

import risks from 'dsv-loader!@/assets/data/oil-risks.csv' // eslint-disable-line import/no-webpack-loader-syntax
import resize from 'vue-resize-directive'
import PriceLegend from './subcomponents/PriceLegend.vue'
import OilRiskBoxes from '@/components/OilRiskBoxes.vue'

export default {
  name: 'oil-risk',
  directives: {
    resize
  },
  components: {
    OilRiskBoxes,
    PriceLegend
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
      risks,
      scenarios: [...new Set(risks.map(r => r.scenario))],
      models: [...new Set(risks.map(r => r.model))],
      years: [...new Set(risks.map(r => r.year))],
      categories: [...new Set(risks.map(r => r.category))],
      variables: [...new Set(risks.map(r => r.variable))],
      regions: [...new Set(risks.map(r => r.region))],
      model: 'REMIND-MAgPIE 1.7-3.0',
      region: 'World',
      svg: {
        width: 320,
        height: 320
      }
    }
  },
  computed: {
    innerWidth () {
      const { width } = this
      return Math.min(width, 1000)
    },
    rows () {
      const { risks, scenarios, years, region, model, variables, categories } = this
      const risks1 = risks.filter(r => r.region === region && r.model === model)
      return scenarios.map(s => {
        const risks2 = risks1.filter(r => r.scenario === s)
        return years.map(y => {
          const risks3 = risks2.filter(r => r.year === y)
          const vars = {}
          variables.forEach(v => {
            vars[v] = {}
            categories.forEach(c => {
              vars[v][c] = +risks3.find(r => r.variable === v && r.category === c).value
            })
          })
          return vars
        })
      })
    },
    layout () {
      const { svg, scenarios, years } = this
      const margin = {
        top: 16,
        right: 0,
        bottom: 16,
        left: 32
      }
      const height = svg.height - margin.top - margin.bottom
      const width = svg.width - margin.left - margin.right
      const rowHeight = height / scenarios.length
      const colWidth = width / years.length
      return {
        margin,
        height,
        width,
        rowHeight,
        colWidth,
        lineHeight: 16,
        boxSize: Math.min(rowHeight, colWidth) - 16
      }
    },
    max () {
      const { rows } = this
      return Math.max(...rows.map(r => {
        return r.map(c => {
          return Object.keys(c).map(k => {
            // return (c[k]['Direct emissions cost'] + c[k]['Revenue']) / c[k]['Primary Energy']
            return Math.max(c[k]['Primary Energy'] * 1000, c[k]['Revenue'])
            // return Object.keys(c[k]).map(v => c[k][v]).reduce((a, b) => a + b)
          })
        })
      }).flat(2))
    }
  },
  methods: {
    onResize (el) {
      const { svg } = this
      const rect = el.querySelector('svg').getBoundingClientRect()
      svg.width = rect.width
      svg.height = rect.height
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "library/src/style/global.scss";

.oil-risk {
  display: flex;
  align-items: center;
  flex-direction: column;

  .wrapper {
    position: relative;
    display: flex;

    $key-width: 256px;
    .key {
      height: 100%;
      width: $key-width;
      padding: $spacing / 2;
      // background: getColor(green, 100);
    }
    .chart {
      padding: $spacing / 2;
      width: calc(100% - #{$key-width});
      height: 100%;
      svg {
        display: block;
        width: 100%;
        height: 100%;
        overflow: visible;

        .axis {
          .x-axis {
            line {
              stroke: $color-black;
            }
            text {
              text-anchor: middle;
            }
          }
          .y-axis {
            line {
              stroke: $color-black;
              stroke-dasharray: 3 5;
            }
            text {
              text-anchor: end;
            }
          }
        }
      }
    }
    @include max-width($narrow) {
      $key-height: 128px;
      flex-direction: column-reverse;
      .key {
        height: $key-height;
        width: 100%;
      }
      .chart {
        width: 100%;
        height: calc(100% - #{$key-height});
      }
    }
  }
}
</style>
