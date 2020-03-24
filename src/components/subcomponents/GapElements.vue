<template>
        <g class="gap_elements">
        <circle :cx="scales.x(2050)" :cy="scales.y(data.valueLabel[0])" :fill="data.colorValue" r="5"/>
        <rect id="indicator" width="5" height="1" :x="scales.x(2052)" :y="scales.y(data.valueLabel[0]) - 2" />
        <text
        :x="scales.x(2054)"
        :y="scales.y(data.valueLabel[0])"
        >
        {{ Math.round(data.valueLabel[0]) + ' EJ/year' }}
        </text>
        <text v-show="data.step > 6"
        :x="scales.x(2104)"
        :y="scales.y(data.transformData.max[0] / 2)"
        >
        Gap in Coal production
        </text>
        <line class="gapline"
          :x1="scales.x(2052)"
          :x2="scales.x(2052)"
          :y1="scales.y(data.gapValue)"
          :y2="scales.y(data.valueLabel[0])"
        />
      </g>
</template>

<script>
export default {
  name: 'CoalRisk',
  props: [
    'data',
    'scales'
  ],
  data () {
    return {
      svgWidth: 0,
      svgHeight: 0,
      chartWidth: 0,
      chartHeight: 0
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "library/src/style/variables.scss";

  text {
    text-anchor: middle;
  }

  path {
    fill: none;
    stroke-width: 3;
  }

  circle {
  transition: cy 0.8s, fill 0.8s;
  transition-timing-function: easeInOutQuint;
  }

  .gapline {
    stroke-width: 5;
    stroke: black;
  }

  rect {
    transition: y 0.8s;
    transition-timing-function: easeInOutQuint;
    stroke-width: 2;
    stroke: black;
  }

  .gap_elements {
    text {
      text-anchor: start;

      transition: y 0.8s;
      transition-timing-function: easeInOutQuint;
    }
  }
</style>
