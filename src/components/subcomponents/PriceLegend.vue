<template>
  <div>
    <p class="graph-title">Regional changes in revenue ($/year) of the fossil fuel sector</p>
    <p class="highlight howto">REMIND-MAgPIE 1.7-3.0</p><br/>
    <div class="legend-cont">
    <p class="howto">How to read:</p>
    <p>hover the visualization to see regions</p>
    <svg viewBox="0 0 193 72" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
            <g id="Artboard-Copy-3" transform="translate(-35, -40)">
                <g id="Group" transform="translate(36, 41)">
                    <g id="Group-8" transform="translate(151, 34) scale(-1, 1) translate(-151, -34) translate(142, 25)" fill-rule="nonzero" stroke="#979797">
                        <polygon id="Rectangle-Copy-3" transform="translate(9, 9) rotate(90) translate(-9, -9) " points="1.18611919e-13 -7.59392549e-14 18 -7.59392549e-14 18 18 1.18611919e-13 18"></polygon>
                    </g>
                    <g id="Group-7" transform="translate(93, 27) scale(-1, 1) translate(-93, -27) translate(77, 11)" fill-rule="nonzero" stroke="#979797">
                        <polygon id="Rectangle-Copy-5" transform="translate(16, 16) rotate(90) translate(-16, -16) " points="2.11473635e-12 0 32 0 32 32 2.11473635e-12 32"></polygon>
                    </g>
                    <g id="Group-6" transform="translate(21.500000, 21.500000) scale(-1, 1) translate(-21.500000, -21.500000) " fill-rule="nonzero" stroke="#979797">
                        <rect id="Rectangle-Copy-7" transform="translate(21.306041, 21.306041) rotate(90) translate(-21.306041, -21.306041) " x="-1.0658141e-14" y="1.03028697e-13" width="42.6120815" height="42.6120815"></rect>
                    </g>
                    <text font-weight="normal" fill="#000000"><tspan x="0" y="69">Size = total revenue ($/Bn)</tspan></text>
                    <line x1="1" y1="51" x2="161" y2="51" id="Path-3" stroke="#979797"></line>
                </g>
            </g>
        </g>
    </svg>
    <svg width="144px" height="197px" viewBox="0 0 144 180" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
            <g id="Artboard-Copy-4" transform="translate(-80, -40)">
                <g id="Group" transform="translate(50, 50)">
                    <rect id="Rectangle" stroke="#806cc6" stroke-width="1.5" fill="#ac9bd9" fill-opacity="0.3" x="0" y="23" width="63" height="63"></rect>
                    <rect id="Rectangle-Copy" stroke="#f39172" stroke-width="1.5" fill="#ffdbcf" x="19" y="102" width="44" height="44"></rect>
                    <rect id="Rectangle-Copy-2" stroke="#ffc361" stroke-width="1.5" fill="#ffecce" x="80" y="102" width="24" height="24"></rect>
                    <line x1="1" y1="94.5" x2="143" y2="94.5" id="Path-2" stroke="#979797"></line>
                    <line x1="72.5" y1="23" x2="72.5" y2="198.5" id="Path-2" stroke="#979797"></line>
                    <text id="No-Policy" font-weight="normal" fill="#806cc6">
                        <tspan x="0" y="0" fill="#806cc6">Current</tspan>
                        <tspan x="0" y="15">Policies</tspan>
                    </text>
                    <text id="2.0ºC" font-size="10" font-weight="normal" fill="#f39172">
                        <tspan x="20" y="164">2.0ºC</tspan>
                    </text>
                    <text id="1.5ºC" font-weight="normal" fill="#ffc361">
                        <tspan x="80" y="147">1.5ºC</tspan>
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

  .howto {
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
