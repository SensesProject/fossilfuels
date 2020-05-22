<template>
  <div class="uncertainty-risk">
    <div class="wrapper" :style="{width: `${innerWidth}px`, height: `${height}px`}">
      <div class="key">
        <p class="graph-title">Uncertainty trends in fossil fuels volumes <SensesTooltip class="superscript" :tooltip="calculation">[1]</SensesTooltip></p>
        <p class="model-label">Multiple Models</p><br/>
        <transition name="fade">
          <div v-show="step >= 2">
            Select foreground model:<br>
            <SensesSelect :options="models" v-model="model"/>
          </div>
        </transition>
        <transition name="fade">
        <UncertaintyLegend v-show="step >= 3" :step="step" call="legend"/>
        </transition>

      </div>
      <div class="chart" v-resize:debounce.initial="onResize">
        <svg>
          <g :transform="`translate(${layout.margin.left} ${layout.margin.top})`">
            <g class="axis">
              <g class="x-axis">
                <g v-for="(y, i) in years" :key="`y-${i}`" :transform="`translate(${layout.colWidth * (i + 0.5)} 0)`">
                  <!-- <circle cy="-5" r="5"/> -->
                  <line :y2="layout.height"/>
                  <text :y="layout.height + layout.lineHeight">{{ y }}s</text>
                </g>
              </g>
              <g class="y-axis">
                <g v-for="(v, i) in variables" :key="`s-${i}`" :transform="`translate(0 ${layout.rowHeight * (i + 0.5)})`">
                  <line v-if="i < variables.length / 2" :x2="layout.width - layout.colWidth * 0.5" :y1="layout.rowHeight / 2" :y2="layout.rowHeight / 2"/>
                  <text :x="-8" :y="4">{{ v }}</text>
                </g>
              </g>
            </g>
            <g class="slopes">
              <!-- <g v-if="step === 1" :transform="`translate(${layout.colWidth * 1}, ${(layout.rowHeight * 1) + 5})`">
                <text>High disagreement between scenarios</text>
                <rect class="bg-overlay" :width="layout.colWidth" :height="layout.rowHeight - 10" rx="15"/>
              </g> -->
              <g v-for="(r, ri) in rows" :key="`r-${ri}`">
                <UncertaintyRiskSlopes v-for="(c, ci) in r" :key="`c-${ri}-${ci}`" :data="c" :size="layout.slopeSize" :max="max" :model="model"
                  :transform="`translate(${layout.colWidth * (ci + 0.5)} ${layout.rowHeight * (ri + 0.5)})`"
                  :scenarios="step === 0 ? ['NPi2020_1000'] : ['NPi2020_1000', 'NPi2020_400', 'NPi']"
                  :show-uncertainty="step >= 2"/>
              </g>
            </g>
          </g>
        </svg>
      </div>
    </div>
  </div>
</template>

<script>

import risks from 'dsv-loader!@/assets/data/c3-uncertainty.csv' // eslint-disable-line import/no-webpack-loader-syntax
import resize from 'vue-resize-directive'
import UncertaintyRiskSlopes from '@/components/UncertaintyRiskSlopes.vue'
import UncertaintyLegend from './subcomponents/UncertaintyLegend.vue'
import SensesSelect from 'library/src/components/SensesSelect.vue'
import SensesTooltip from 'library/src/components/SensesTooltip.vue'

export default {
  name: 'uncertainty-risk',
  directives: {
    resize
  },
  components: {
    UncertaintyRiskSlopes,
    UncertaintyLegend,
    SensesSelect,
    SensesTooltip
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
      calculation: 'The calculation for trend slopes is obtained via the following calculation: (PE(t+10) - PE(t)) / PE(2020) * 90° (rel. change to 2020)',
      scenarios: [...new Set(risks.map(r => r.scenario))],
      models: [...new Set(risks.map(r => r.model))],
      years: [...new Set(risks.map(r => r.year))],
      variables: [...new Set(risks.map(r => r.variable))],
      model: 'REMIND-MAgPIE 1.7-3.0',
      // region: 'World',
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
      const { risks, scenarios, years, variables } = this
      // const risks1 = risks.filter(r => r.region === region && r.model === model)
      return variables.map(v => {
        const f1 = risks.filter(r => r.variable === v)
        return years.map(y => {
          const f2 = f1.filter(f => f.year === y)
          return scenarios.map(s => {
            return {
              scenario: s,
              data: f2.filter(f => f.scenario === s)
            }
          })
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
        slopeSize: Math.min((rowHeight - 16) / 3, colWidth - 16)
      }
    },
    max () {
      const { risks } = this
      return Math.max(...risks.map(r => Math.abs(+r.value)))
    }
  },
  methods: {
    onResize (el) {
      const { svg } = this
      const rect = el.querySelector('svg').getBoundingClientRect()
      svg.width = rect.width
      svg.height = rect.height
    }
  },
  watch: {
    step (step) {
      if (step < 2) this.model = 'REMIND-MAgPIE 1.7-3.0'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "library/src/style/global.scss";

.uncertainty-risk {
  display: flex;
  align-items: center;
  flex-direction: column;

  .superscript{
      display: inline;
    vertical-align: super;
    font-size: 10px;
  }

  .model-label {
    color: $color-neon;
    // margin-top: 10px;
    width: 120px;
    font-weight: normal;
  }

  .wrapper {
    position: relative;
    display: flex;

    $key-width: 256px;
    .key {
      height: 100%;
      width: $key-width;
      padding: $spacing / 2;
      // background: getColor(green, 100);

      .legend {
        height: 50%;
      }

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

        .bg-overlay {
          fill: getColor(neon, 100);
          fill-opacity: 0.5;
          // stroke-width: 1px;
          // stroke: getColor(neon, 40);
        }

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
  .fade-enter-active, .fade-leave-active {
    transition: opacity $transition;
  }
  .fade-enter, .fade-leave-to {
    opacity: 0;
  }
}
</style>
