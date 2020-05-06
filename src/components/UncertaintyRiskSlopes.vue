<template>
  <g class="uncertainty-risk-slopes">
    <g v-for="(s, i) in data" :key="`s-${i}`" :transform="`translate(0 ${size * (i - 1)})`">
      <template v-for="(v, vi) in s.data">
          <line :key="`v-${i}-${vi}`"
            :x1="-size/2" :x2="size/2" :transform="`rotate(${scale(v.value)})`"
            :class="[colors[s.scenario], { opaque: model === v.model, hidden: !showUncertainty && (model !== v.model || scenarios.indexOf(s.scenario) === -1 )}]"/>
      </template>
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
    },
    showUncertainty: {
      type: Boolean,
      default: false
    },
    scenarios: {
      type: Array,
      default () { return ['NPi2020_1000', 'NPi2020_400', 'NPi'] }
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
        .range([80, -80])
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

    &.hidden {
      opacity: 0;
    }
  }
}
</style>
