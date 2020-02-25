<template>
  <g class="oil-risk-boxes">
    <rect v-for="(r, i) in rects" :key="`r-${i}`" class="filled" v-bind="r.bind" :opacity="r.opacity"/>
    <rect v-for="(r, i) in rects" :key="`r2-${i}`" v-bind="r.bind"/>
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
    },
    revenueDomains: {
      type: Object,
      default: null
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
      const { data, scale, revenueDomains } = this
      return ['Gas', 'Oil', 'Coal'].map((k1, i) => {
        return ['Primary Energy'].map(k2 => {
          const opacScale = scalePow()
            .exponent(0.5)
            .domain(revenueDomains[k1])
            .range([0.2, 0.8])
          const size = scale(data[k1]['Primary Energy'])
          return {
            bind: {
              class: [k1],
              transform: `rotate(${90 * i}) translate(8 8)`,
              width: size,
              height: size
            },
            // opacity: opacScale(data[k1].Revenue / data[k1]['Primary Energy'])
            opacity: opacScale(data[k1].Revenue / data[k1]['Primary Energy'])
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
        stroke: none;
        fill: getColor(gray, 50);
      }
    }

    &.Oil {
      stroke: getColor(orange, 40);
      &.filled {
        stroke: none;
        fill: getColor(orange, 50);
      }
    }

    &.Gas {
      stroke: getColor(red, 40);
      &.filled {
        stroke: none;
        fill: getColor(red, 50);
      }
    }
  }
}
</style>
