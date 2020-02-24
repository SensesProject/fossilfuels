<template>
  <g class="oil-risk-boxes">
    <rect v-for="(r, i) in rects" :key="`r-${i}`" v-bind="r"/>
  </g>
</template>

<script>
import { scalePow } from 'd3'

export default {
  name: 'oil-risk-boxes',
  props: {
    data: {
      type: Object,
      default: null
    },
    size: {
      type: Number,
      default: 100
    },
    max: {
      type: Number,
      default: 100
    }
  },
  data () {
    return {
    }
  },
  computed: {
    scale () {
      const { max, size } = this
      return scalePow()
        .exponent(0.5)
        .domain([0, max])
        .range([0, size / 2])
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

.oil-risk-boxes {
  rect {
    fill: none;

    &.Coal {
      stroke: getColor(gray, 40);
      &.filled {
        fill: getColor(gray, 80);
      }
    }

    &.Oil {
      stroke: getColor(orange, 40);
      &.filled {
        fill: getColor(orange, 80);
      }
    }

    &.Gas {
      stroke: getColor(red, 40);
      &.filled {
        fill: getColor(red, 80);
      }
    }
  }
}
</style>
