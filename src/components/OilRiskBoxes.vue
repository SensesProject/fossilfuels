<template>
  <g class="oil-risk-boxes">
    <rect v-for="(r, i) in rects" :key="`r-${i}`" v-bind="r"/>
    <template v-if="showLabels">
      <g v-for="(l, i) in labels" :key="`l-${i}`" :class="['label', l.class]" :transform="`translate(${l.x} ${l.y})`">
        <text class="top">{{ l.top }}</text>
        <text class="bottom" y="16">{{ l.bottom }}</text>
      </g>
    </template>
    <rect :width="size" :height="size" :x="-size / 2" :y="-size / 2"
      class="interaction-layer" @mouseover="showLabels = true" @mouseout="showLabels = false" @mouseleave="showLabels = false"/>
  </g>
</template>

<script>
import { scalePow, format } from 'd3'

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
      showLabels: false
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
        return ['Revenue', 'Primary Energy'].map(k2 => {
          const size = scale(k2 === 'Revenue' ? (data[k1][k2]) : (data[k1][k2] * 1000))
          // const size = scale(data[k1][k2])
          return {
            class: [k1, { filled: k2 !== 'Revenue' }],
            transform: `rotate(${90 * i}) translate(8 8)`,
            width: size,
            height: size
          }
        })
      }).flat()
    },
    labels () {
      const { data, scale } = this
      const formatter = format(`.0f`)
      const gas = {
        y: scale(data.Gas.Revenue) + 8 + 16,
        x: 8,
        top: `${formatter(data.Gas['Primary Energy'])} EJ/yr`,
        bottom: `${formatter(data.Gas.Revenue / 1000)} Bn$`,
        class: 'Gas'
      }
      const oil = {
        y: scale(data.Oil.Revenue) + 8 + 16,
        x: -8,
        top: `${formatter(data.Oil['Primary Energy'])} EJ/yr`,
        bottom: `${formatter(data.Oil.Revenue / 1000)} B$`,
        class: 'Oil'
      }
      const coal = {
        y: -scale(data.Coal.Revenue) + 8 - 40,
        x: -8,
        top: `${formatter(data.Coal.Revenue / 1000)} Bn$`,
        bottom: `${formatter(data.Coal['Primary Energy'])} EJ/yr`,
        class: 'Coal'
      }
      return [gas, oil, coal]
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
    &.interaction-layer {
      pointer-events: all;
    }
  }
  .label {
    &.Coal {
      .top {
        fill: getColor(gray, 40);
      }
      .bottom {
        fill: getColor(gray, 60);
      }
      text-anchor: end;
    }

    &.Oil {
      .top {
        fill: getColor(orange, 60);
      }
      .bottom {
        fill: getColor(orange, 40);
      }
      text-anchor: end;
    }

    &.Gas {
      .top {
        fill: getColor(red, 60);
      }
      .bottom {
        fill: getColor(red, 40);
      }
    }
  }
}
</style>
