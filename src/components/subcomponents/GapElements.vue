<template>
        <g class="gap_elements">
        <text :x="scales.x(2000)" :y="scales.y(131.2274)">Coal</text>
        <circle :cx="scales.x(2100)" :cy="scales.y(data.valueLabel[0])" :fill="data.colorValue" r="5"/>
        <rect class="gapline" width="5" height="1" :x="scales.x(2102)" :y="scales.y(data.valueLabel[0]) - 2" />
        <text
        :x="scales.x(2104)"
        :y="scales.y(data.valueLabel[0])"
        >
        {{ data.valueLabel[0] }}
        </text>
        <text v-show="data.step > 6"
        :x="scales.x(2104)"
        :y="scales.y(data.transformData.max[0] / 2)"
        >
        Gap in Coal production
        </text>
        <line class="gapline"
          :x1="scales.x(2101)"
          :x2="scales.x(2101)"
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
      colors: ['#c8005f', '#ffac00', '#00cc84'],
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
    stroke-width: 2;
    stroke: $color-neon;
  }

  rect {
    transition: y 0.8s;
    transition-timing-function: easeInOutQuint;
  }

  .gap_elements {
    text {
      text-anchor: start;

      transition: y 0.8s;
      transition-timing-function: easeInOutQuint;
    }
  }
</style>
