<template>
  <div>
    <p class="graph-title">Uncertainty trends on fossil fuels volumes</p>
    <div class="legend-cont">
      <p>How to read:</p>
      <svg id="slope">
        <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
          <g id="Artboard" transform="translate(-47,20)">
            <g id="Group-5" transform="translate(47, 7)">
              <g id="Group-4" transform="translate(25, 55)">
                <g id="Group-2">
                  <g id="Group" fill-rule="nonzero" stroke="#848484" stroke-linecap="round" stroke-width="4">
                    <line x1="0.106540997" y1="58.1944301" x2="129.424918" y2="58.08726" id="Path-Copy-3" transform="translate(64.765730, 58.140845) rotate(63.299786) translate(-64.765730, -58.140845) " />
                    <g v-if="step >= 0">
                      <line x1="0.013505679" y1="58.1811004" x2="129.517953" y2="58.1005897" id="Path-Copy" stroke-opacity="0.3" transform="translate(64.765730, 58.140845) rotate(18.546616) translate(-64.765730, -58.140845) " />
                      <line x1="0.0463855819" y1="58.2044098" x2="129.485074" y2="58.0772804" id="Path-Copy-2" stroke-opacity="0.3" transform="translate(64.765730, 58.140845) rotate(36.119661) translate(-64.765730, -58.140845) " />
                      <line x1="0.0572183983" y1="58.2069074" x2="129.474241" y2="58.0747827" id="Path-Copy-4" stroke-opacity="0.3" transform="translate(64.765730, 58.140845) rotate(40.896718) translate(-64.765730, -58.140845) " />
                      <line x1="4.87484137e-13" y1="58.1408451" x2="129.531459" y2="58.1408451" id="Path-Copy-5" stroke-opacity="0.3" transform="translate(64.765730, 58.140845) rotate(-0) translate(-64.765730, -58.140845) " />
                    </g>
                  </g>
                  <path d="M75.4118429,128.858485 L73.1042229,131.826726 C117.844155,131.839432 154.102734,95.6527162 154.090024,51.0014305 L157.652427,54.7946457" id="Path" stroke="#979797" stroke-width="1" transform="translate(115.378325, 91.414078) rotate(-8) translate(-115.378325, -91.414078) " />
                </g>
                <text id="-" font-size="12" fill="#000000">
                  <tspan x="67" y="141">-</tspan>
                </text>
                <text id="+" font-size="12" fill="#000000">
                  <tspan x="144" y="38">+</tspan>
                </text>
              </g>
              <g id="Group-3" transform="translate(23, 0)" fill="#000000">
                <text id="text" font-size="18" x="-20">
                  Trend in primary energy
                  <tspan x="-20" y="20">volume</tspan>
                </text>
              </g>
            </g>
          </g>
        </g>
      </svg>
      <svg id="scenarios">
        <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
          <g id="Artboard-Copy-2" transform="translate(-49.000000, -24.000000)">
            <g id="Group" transform="translate(50.000000, 40.000000)">
              <text id="No-Policy" font-size="10" x="0" y="19">Scenarios:</text>
              <transition name="fade">
                <text v-if="step >= 1" id="Scenarios" font-size="10" fill="#000000">
                  <tspan x="0" y="9">No Policy</tspan>
                </text>
              </transition>
              <transition name="fade">
                <g v-if="step >= 2">
                  <text id="Current-Model" font-size="10" fill="#000000">
                    <tspan x="8" y="100">Current</tspan>
                    <tspan x="14" y="115">Model</tspan>
                  </text>
                  <text id="Other-Models" font-size="10" fill="#000000">
                    <tspan x="104" y="100">Other</tspan>
                    <tspan x="102" y="115">Models</tspan>
                  </text>
                </g>
              </transition>
              <text id="2.0ºC" font-size="9" fill="#000000">
                <tspan x="0" y="34">2.0ºC</tspan>
              </text>
              <transition name="fade">
                <text v-if="step >= 1" id="1.5ºC" font-size="9" fill="#000000">
                  <tspan x="0" y="58">1.5ºC</tspan>
                </text>
              </transition>
              <transition name="fade">
                <g v-if="step >= 1" id="nopol" transform="translate(0.000000, 18.000000)" fill-rule="nonzero" stroke="#745DFF" stroke-linecap="round" stroke-width="4">
                  <line x1="0" y1="0.5" x2="66" y2="0.5" id="Path-Copy-5" />
                  <line v-if="step >= 2" x1="91" y1="0.5" x2="157" y2="0.5" id="Path-Copy-8" stroke-opacity="0.5" />
                </g>
              </transition>
              <g id="twodegr" transform="translate(0.000000, 42.000000)" fill-rule="nonzero" stroke="#F56A23" stroke-linecap="round" stroke-width="4">
                <line x1="0" y1="0.5" x2="66" y2="0.5" id="Path-Copy-6" />
                <transition name="fade">
                  <line v-if="step >= 2" x1="91" y1="0.5" x2="157" y2="0.5" id="Path-Copy-9" stroke-opacity="0.5" />
                </transition>
              </g>
              <transition name="fade">
                <g v-if="step >= 1" id="onepointfive" transform="translate(0.000000, 66.000000)" fill-rule="nonzero" stroke="#FFC300" stroke-linecap="round" stroke-width="4">
                  <line x1="0" y1="0.5" x2="66" y2="0.5" id="Path-Copy-7" />
                  <transition name="fade">
                    <line v-if="step >= 2" x1="91" y1="0.5" x2="157" y2="0.5" id="Path-Copy-10" stroke-opacity="0.5" />
                  </transition>
                </g>
              </transition>
            </g>
          </g>
        </g>
      </svg>
    </div>
  </div>
</template>

<script>
export default {
  name: 'OilLegend',
  data () {
    return {
      margintop: 2,
      marginleft: 2
    }
  },
  props: ['step']
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "library/src/style/global.scss";
.fade-enter-active, .fade-leave-active {
  transition: opacity $transition;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}
div {
  height: 280px * 2;
  margin-top: 20px;
  margin-left: 5px;

  p {
  font-weight: bold;
  }
}

.legend-cont {
  padding-top: 20px;
}
svg {
  width: 100%;
  height: 235px;
  overflow: visible;

  text {
  font-size: 14px;
  }
}

@include max-width($narrow) {
  svg {
  overflow: hidden;
  }

  p {
  position: absolute;
  }
}
</style>
