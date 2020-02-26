<template>
  <g class="uncertainty-risk-slopes">
    <g v-for="(s, i) in data" :key="`s-${i}`" :transform="`translate(0 ${size * (i - 1)})`">
      <line v-for="(v, vi) in s.data" :key="`v-${i}-${vi}`" :x1="-size/2" :x2="size/2" :class="[colors[s.scenario], { opaque: model === v.model }]" :transform="`rotate(${scale(v.value)})`"/>
    </g>
  </g>
</template>

<script>
import { scalePow } from 'd3'

export default {
  name: 'uncertainty-risk-slopes',
  props: {
    data: {
      type: Array,
      default: null
    },
    size: {
      type: Number,
      default: 100
    },
    max: {
      type: Number,
      default: 100
    },
    model: {
      type: String,
      default: null
    }
  },
  data () {
    return {
      colors: {
        'NPi2020_1000': 'orange',
        'NPi2020_400': 'yellow',
        'NPi': 'violet'
      }
    }
  },
  computed: {
    scale () {
      const { max } = this
      return scalePow()
        .exponent(1)
        .domain([-max, max])
        .range([85, -85])
    },
    rects () {
      const { data, scale } = this
      return ['Gas', 'Oil', 'Coal'].map((k1, i) => {
        return ['Revenue', 'Direct emissions cost'].map(k2 => {
          // const size = scale((k2 === 'Revenue' ? (data[k1][k2]) : (data[k1][k2] + data[k1]['Revenue'])) / data[k1]['Primary Energy'])
          const size = scale((k2 === 'Revenue' ? (data[k1][k2]) : (data[k1][k2] + data[k1]['Revenue'])))
          return {
            class: [k1, { filled: k2 === 'Revenue' }],
            transform: `rotate(${90 * i}) translate(8 8)`,
            width: size,
            height: size
          }
        })
      }).flat()
    }
  }
}
</script>

<style scoped lang="scss">
@import "library/src/style/global.scss";

.uncertainty-risk-slopes {
  line {
    @include tint(stroke);
    stroke-width: 5;
    stroke-linecap: round;
    opacity: 0.15;
    transition: opacity 0.8s;

    &.opaque {
      transition: opacity 1s easeOutQuart;
      opacity: 1;
    }
  }
}
</style>
