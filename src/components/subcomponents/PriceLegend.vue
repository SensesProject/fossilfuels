<template>
  <div>
    <p class="graph-title">Regional changes in revenue of the fossil fuel sector</p>
    <p class="model-label">REMIND-MAgPIE 1.7-3.0</p><br/>
    <div class="legend-cont">
    <p class="howto">How to read:</p>
    <p>hover the boxes to activate regions</p>
    <svg width="191px" height="104px" viewBox="0 0 191 104" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
            <g id="Artboard-Copy-3" transform="translate(-30, -18)">
                <g id="Group" transform="translate(31, 17)">
                    <line x1="63" y1="14" x2="165" y2="72" id="Path" stroke="#BCB6EC"></line>
                    <line x1="160" y1="77" x2="63" y2="77" id="Path-8" stroke="#BCB6EC"></line>
                    <polygon id="Rectangle-Copy-3" stroke="#4E40B2" fill-rule="nonzero" transform="translate(162.5, 74.5) scale(-1, 1) rotate(90) translate(-162.5, -74.5) " points="160 72 165 72 165 77 160 77"></polygon>
                    <polygon id="Rectangle-Copy-5" stroke="#4E40B2" fill-rule="nonzero" transform="translate(31.5, 45.5) scale(-1, 1) rotate(90) translate(-31.5, -45.5) " points="4.16324285e-12 14 63 14 63 77 4.16324285e-12 77"></polygon>
                    <text id="Size-=-total-revenue" font-weight="normal" fill="#000000">
                        <tspan x="2" y="103">Size = total revenue (Bn $)</tspan>
                    </text>
                    <line x1="0.5" y1="86" x2="166" y2="85.5" id="Path-3" stroke="#979797"></line>
                    <text id="&gt;-3000-Bn-$" font-weight="normal" fill="#000000">
                        <tspan x="0" y="8" font-size="10">&gt; 3000 Bn $ </tspan>
                    </text>
                    <text id="&lt;-5-Bn-$" font-weight="normal" fill="#000000">
                        <tspan x="140" y="67" font-size="10">&lt; 5 Bn $ </tspan>
                    </text>
                </g>
            </g>
        </g>
    </svg>
    <svg width="144px" height="197px" viewBox="0 0 144 180" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
            <g id="Artboard-Copy-4" transform="translate(-80, -40)">
                <g id="Group" transform="translate(50, 50)">
                    <rect id="Rectangle" stroke="#4E40B2" stroke-width="1" fill="#ac9bd9" fill-opacity="0.3" x="0" y="23" width="63" height="63"></rect>
                    <rect id="Rectangle-Copy" stroke="#e66b46" stroke-width="1" fill="#ffdbcf" x="19" y="102" width="44" height="44"></rect>
                    <rect id="Rectangle-Copy-2" stroke="#FFAC00" stroke-width="1" fill="#ffecce" x="80" y="102" width="24" height="24"></rect>
                    <line x1="1" y1="94.5" x2="143" y2="94.5" id="Path-2" stroke="#979797"></line>
                    <line x1="72.5" y1="23" x2="72.5" y2="198.5" id="Path-2" stroke="#979797"></line>
                    <text id="No-Policy" font-weight="normal" fill="#4E40B2">
                        <tspan x="0" y="0">Current</tspan>
                        <tspan x="0" y="15">Policies</tspan>
                    </text>
                    <text id="2.0ºC" font-size="10" font-weight="normal" fill="#e66b46">
                        <tspan x="20" y="164">2.0ºC</tspan>
                    </text>
                    <text id="1.5ºC" font-weight="normal" fill="#FFAC00">
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

.model-label {
  color: $color-neon;
  margin-top: 10px;
  font-weight: normal;
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
