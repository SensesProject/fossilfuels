<template>
  <g class="oil-risk-boxes">
    <template v-if="showLabels">
      <g v-for="(l, i) in labels" :key="`l-${i}`" :class="['label', l.class]" :transform="`translate(${l.x} ${l.y})`">
        <text class="top">{{ l.top }}</text>
        <text class="bottom" y="16">{{ l.bottom }}</text>
        <!-- <text v-if="i === 2" class="region" y="-16">{{ region || 'World' }}</text> -->
      </g>
    </template>
    <rect :width="(size + 16)" :height="(size + 16)" :x="-(size + 16) / 2" :y="-(size + 16) / 2"
      class="interaction-layer" @mouseover="showLabels = true" @mouseout="showLabels = false" @mouseleave="showLabels = false"/>
    <g v-for="(r, i) in rects" :key="`r-${i}`" :transform="r.transform">
      <rect v-for="(reg, i2) in r.regions" :key="`reg-${i2}`" v-bind="reg.bindings"
        class="region"
        :class="[...reg.class, {'semi-active': showLabels, active: reg.region === region}]"
        @mouseover="region = reg.region; showLabels = true"
        @mouseleave="region = null; showLabels = false"
        @mouseout="region = null; showLabels = false"/>
      <rect v-bind="r.world"/>
    </g>
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
      showLabels: false,
      region: null
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
      return ['NPi2020_400_V3', 'NPi2020_1000_V3', 'NPi_V3'].map((scenario, i) => {
        const size = scale(data[scenario].World)
        let offset = 0
        let x = 8
        let y = 8
        if (i >= 1) {
          x = -size - 8
        }
        if (i >= 2) {
          y = -size - 8
        }
        return {
          transform: `rotate(${0 * i}) translate(${x} ${y})`,
          world: {
            class: [scenario],
            width: size,
            height: size
          },
          regions: ['Asia (No Japan)', 'Mid. East + Africa', 'Latin America', 'Central Asia', 'OECD90 + EU'].map((region, i2, regions) => {
            const width = size * (data[scenario][region] / data[scenario].World)
            offset += width
            return {
              class: [region, scenario],
              bindings: {
                width,
                height: size,
                transform: `translate(${offset - width} 0)`
              },
              region
            }
          })
        }
      }).flat()
    },
    labels () {
      const { data, scale, region } = this
      console.log(region)
      const formatter = format(`.0f`)
      const a = {
        y: scale(data.NPi2020_400_V3.World) + 8 + 16,
        x: 8,
        top: `${formatter(data.NPi2020_400_V3[region || 'World'] / 1000000000)} Bn$`,
        // bottom: '1.5°C',
        class: 'NPi2020_400_V3'
      }
      const b = {
        y: scale(data.NPi2020_1000_V3.World) + 8 + 16,
        x: -8,
        top: `${formatter(data.NPi2020_1000_V3[region || 'World'] / 1000000000)} Bn$`,
        // bottom: '2.0°C',
        class: 'NPi2020_1000_V3'
      }
      const c = {
        y: -scale(data.NPi_V3.World) + 8 - 24 - 16,
        x: -8,
        bottom: `${formatter(data.NPi_V3[region || 'World'] / 1000000000)} Bn$`,
        // top: 'No Policy',
        top: region || 'World',
        class: 'NPi_V3'
      }
      // const d = {
      //   y: -8 - 16,
      //   x: 8,
      //   bottom: region || 'World',
      //   // top: 'No Policy',
      //   class: 'region'
      // }
      return [a, b, c]
    }
  }
}
</script>

<style scoped lang="scss">
@import "library/src/style/global.scss";

.oil-risk-boxes {
  rect {
    fill: none;

    &.NPi2020_400_V3 {
      stroke: getColor(yellow, 50);
      &.region {
        stroke: getColor(yellow, 80);
        pointer-events: all;
        &.semi-active {
          stroke: getColor(yellow, 60);
          fill: getColor(yellow, 100);
        }
        &.active {
          stroke: getColor(yellow, 60);
          fill: getColor(yellow, 60);
        }
      }
    }

    &.NPi2020_1000_V3 {
      stroke: getColor(orange, 50);
      &.region {
        stroke: getColor(orange, 80);
        pointer-events: all;
        &.semi-active {
          stroke: getColor(orange, 60);
          fill: getColor(orange, 100);
        }
        &.active {
          stroke: getColor(orange, 60);
          fill: getColor(orange, 60);
        }
      }
    }

    &.NPi_V3 {
      stroke: getColor(violet, 50);
      &.region {
        stroke: getColor(violet, 80);
        pointer-events: all;
        &.semi-active {
          stroke: getColor(violet, 60);
          fill: getColor(violet, 100);
        }
        &.active {
          stroke: getColor(violet, 60);
          fill: getColor(violet, 60);
        }
      }
    }
    &.interaction-layer {
      pointer-events: all;
    }
  }
  .label {
    &.NPi2020_400_V3 {
      .top {
        fill: getColor(yellow, 50);
      }
      .bottom {
        fill: getColor(yellow, 60);
      }
    }

    &.NPi2020_1000_V3 {
      .top {
        fill: getColor(orange, 50);
      }
      .bottom {
        fill: getColor(orange, 60);
      }
      text-anchor: end;
    }

    &.NPi_V3 {
      .top {
        // fill: getColor(violet, 60);
        font-weight: $font-weight-bold;
      }
      .bottom {
        fill: getColor(violet, 50);
      }
      text-anchor: end;
    }
    &.region {
      .top {
        fill: getColor(violet, 50);
      }
      // text-anchor: end;
    }
  }
}
</style>
