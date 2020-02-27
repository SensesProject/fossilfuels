<template>
  <div>
    <p class="graph-title">Fossil Fuels volatily ($/year)</p>
    <div class="legend-cont">
    <p>How to read:</p>
  <svg id="square">
        <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
            <g id="Artboard-Copy-3" transform="translate(-36, -29)">
                <g id="Group-2" transform="translate(37, 30)">
                    <g id="Group" transform="translate(80, 21) scale(-1, 1) translate(-80, -21) translate(-0, 0)" fill-rule="nonzero">
                        <g id="Group-8">
                            <rect id="Rectangle-Copy-3" stroke="#979797" transform="translate(21.306041, 21.306041) rotate(90) translate(-21.306041, -21.306041) " x="-1.0658141e-14" y="1.03028697e-13" width="42.6120815" height="42.6120815"></rect>
                            <rect id="Rectangle-Copy-4" fill="#8E8E8E" transform="translate(37.742584, 4.869497) rotate(90) translate(-37.742584, -4.869497) " x="32.8730866" y="1.05693232e-13" width="9.73899489" height="9.73899489"></rect>
                        </g>
                        <g id="Group-7" transform="translate(59, 0)">
                            <rect id="Rectangle-Copy-5" stroke="#979797" transform="translate(21.306041, 21.306041) rotate(90) translate(-21.306041, -21.306041) " x="-1.0658141e-14" y="1.03028697e-13" width="42.6120815" height="42.6120815"></rect>
                            <rect id="Rectangle-Copy-6" fill="#8E8E8E" transform="translate(32.740000, 9.740000) rotate(90) translate(-32.740000, -9.740000) " x="23" y="8.8817842e-15" width="19.48" height="19.48"></rect>
                        </g>
                        <g id="Group-6" transform="translate(118, 0)">
                            <rect id="Rectangle-Copy-7" stroke="#979797" transform="translate(21.306041, 21.306041) rotate(90) translate(-21.306041, -21.306041) " x="-1.0658141e-14" y="1.03028697e-13" width="42.6120815" height="42.6120815"></rect>
                            <rect id="Rectangle-Copy-8" fill="#8E8E8E" transform="translate(23.480000, 19.480000) rotate(90) translate(-23.480000, -19.480000) " x="4" y="1.77635684e-14" width="38.96" height="38.96"></rect>
                        </g>
                    </g>
                    <text id="Gap-between-volume-a" fill="#000000">
                        <tspan x="0" y="72">Gap between volume and </tspan>
                        <tspan x="55" y="90">revenue</tspan>
                    </text>
                    <line x1="1" y1="51" x2="161" y2="51" id="Path-3" stroke="#979797"></line>
                </g>
            </g>
        </g>
  </svg>

  <svg id="colors">
      <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
          <g id="Artboard-Copy-4" transform="translate(-40, -30)">
              <g id="Group-4" transform="translate(40, 62)">
                  <g id="Group" transform="translate(20, 0)">
                      <rect id="Rectangle" stroke="#75757A" fill="#D8D8E4" x="0" y="16" width="17" height="17"></rect>
                      <text id="Coal" font-family="IBMPlexMono, IBM Plex Mono" font-size="10" font-weight="normal" fill="#000000">
                          <tspan x="0" y="10">Coal</tspan>
                      </text>
                      <rect id="Rectangle-Copy-3" stroke="#75757A" x="100" y="16" width="17" height="17"></rect>
                      <line x1="17.5" y1="24.5" x2="100.5" y2="24.5" id="Path-2-Copy-2" stroke="#808084"></line>
                  </g>
                  <g id="Group-2" transform="translate(20, 37)">
                      <rect id="Rectangle-Copy" stroke="#A85036" fill="#FCB69F" x="0" y="16" width="17" height="17"></rect>
                      <text id="Oil" font-family="IBMPlexMono, IBM Plex Mono" font-size="10" font-weight="normal" fill="#000000">
                          <tspan x="0" y="10">Oil</tspan>
                      </text>
                      <rect id="Rectangle-Copy-4" stroke="#A85036" x="100" y="16" width="17" height="17"></rect>
                      <line x1="17.5" y1="24.5" x2="100.5" y2="24.5" id="Path-2-Copy" stroke="#A85036"></line>
                  </g>
                  <g id="Group-3" transform="translate(20, 74)">
                      <rect id="Rectangle-Copy-2" stroke="#931547" fill="#ED96AB" x="0" y="16" width="17" height="17"></rect>
                      <text id="Gas" font-family="IBMPlexMono, IBM Plex Mono" font-size="10" font-weight="normal" fill="#000000">
                          <tspan x="0" y="10">Gas</tspan>
                      </text>
                      <rect id="Rectangle-Copy-5" stroke="#931547" x="100" y="16" width="17" height="17"></rect>
                      <line x1="17.5" y1="24.5" x2="100.5" y2="24.5" id="Path-2" stroke="#9E2E5B"></line>
                  </g>
                  <text id="Volume-of-energy" font-family="IBMPlexMono, IBM Plex Mono" font-size="10" font-weight="normal" fill="#000000">
                      <tspan x="1.5" y="131">Volume of </tspan>
                      <tspan x="10.5" y="144">energy</tspan>
                  </text>
                  <text id="Revenue-($/year)" font-family="IBMPlexMono, IBM Plex Mono" font-size="10" font-weight="normal" fill="#000000">
                      <tspan x="107.5" y="131">Revenue</tspan>
                      <tspan x="104.5" y="144">($/year)</tspan>
                  </text>
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
      marginleft: 2,
      revX: 0,
      revY: 0,
      chartWidth: 0,
      chartHeight: 0
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "library/src/style/global.scss";

div {
  height: 256px * 2;
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
  height: 180px;

  text {
    font-size: 14px;
  }
}

#square {
  margin-top: 10px;
  height: 100px;
}

#colors {
  width: 100%;
}

@include max-width($narrow) {
  svg {
    overflow: hidden;
    &#square{
    margin-left: 110px;
    margin-right: 20px;
    }
  }

  p {
    position: absolute;
  }
}
</style>
