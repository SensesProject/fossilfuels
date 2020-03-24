<template>
  <div>
    <p class="graph-title">Uncertainty trends on fossil fuels volumes</p>
    <p class="highlight">Multiple Models</p><br/>
    <div class="legend-cont">
      <p>How to read:</p>
      <svg viewBox="0 0 163 226" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
          <g id="slope" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
              <g id="Artboard" transform="translate(-80, -20)">
                  <g id="Group-4" transform="translate(63, 7)">
                      <g id="Group-2" transform="translate(0, 92)">
                          <g id="Group" transform="translate(0, 28)" fill-rule="nonzero" stroke="#848484" stroke-linecap="round" stroke-width="5">
                              <line x1="0.013505679" y1="46.4345511" x2="129.517953" y2="46.3540404" id="Path-Copy" stroke-opacity="0.5" transform="translate(64.765730, 46.394296) rotate(-44.453384) translate(-64.765730, -46.394296) "></line>
                              <line x1="9.32730846" y1="13" x2="120.204151" y2="79.7885916" id="Path-Copy-2" stroke-opacity="0.5"></line>
                              <line x1="0.106540997" y1="46.4478808" x2="129.424918" y2="46.3407108" id="Path-Copy-3" transform="translate(64.765730, 46.394296) rotate(0.299786) translate(-64.765730, -46.394296) "></line>
                              <line x1="5.57745461" y1="20.2419749" x2="123.954005" y2="72.5466167" id="Path-Copy-4" stroke-opacity="0.5"></line>
                              <line x1="3.16986043" y1="66.4080069" x2="126.361599" y2="26.3805847" id="Path-Copy-5" stroke-opacity="0.5"></line>
                          </g>
                          <path d="M96.3966075,109.160623 L94.0493629,112.172004 C139.557535,112.184895 176.438717,75.4722455 176.425789,30.1720037 L180.049363,34.020349" id="Path" stroke="#979797" stroke-width="0.4" transform="translate(137.049363, 71.172004) rotate(-44) translate(-137.049363, -71.172004) "></path>
                          <text id="-" fill="#000000">
                              <tspan x="125" y="139">-</tspan>
                          </text>
                          <text id="+" fill="#000000">
                              <tspan x="125" y="12">+</tspan>
                          </text>
                      </g>
                      <g id="Group-3" transform="translate(7, 0)" fill="#000000" font-weight="normal">
                          <text id="Trend-in-primary-ene" font-size="10">
                              <tspan x="10" y="48">Trend in primary </tspan>
                              <tspan x="19" y="61">energy volume</tspan>
                          </text>
                      </g>
                  </g>
              </g>
          </g>
      </svg>
      <svg id="scenarios">
        <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
          <g id="Artboard-Copy-2" transform="translate(-49, -24)">
            <g id="Group" transform="translate(50, 40)">
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
                <g v-if="step >= 1" id="nopol" transform="translate(0, 18)" fill-rule="nonzero" stroke="#745DFF" stroke-linecap="round" stroke-width="4">
                  <line x1="0" y1="0.5" x2="66" y2="0.5" id="Path-Copy-5" />
                  <line v-if="step >= 2" x1="91" y1="0.5" x2="157" y2="0.5" id="Path-Copy-8" stroke-opacity="0.5" />
                </g>
              </transition>
              <g id="twodegr" transform="translate(0, 42)" fill-rule="nonzero" stroke="#F56A23" stroke-linecap="round" stroke-width="4">
                <line x1="0" y1="0.5" x2="66" y2="0.5" id="Path-Copy-6" />
                <transition name="fade">
                  <line v-if="step >= 2" x1="91" y1="0.5" x2="157" y2="0.5" id="Path-Copy-9" stroke-opacity="0.5" />
                </transition>
              </g>
              <transition name="fade">
                <g v-if="step >= 1" id="onepointfive" transform="translate(0, 66)" fill-rule="nonzero" stroke="#FFC300" stroke-linecap="round" stroke-width="4">
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

.highlight {
  margin-top: 10px;
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
