<template>
  <div class="oil-risk">
    <svg :width="innerWidth" :height="height"></svg>
</div>
</template>

<script>
// import * as d3 from 'd3'
// import _ from 'lodash'

import risks from 'dsv-loader!@/assets/data/oil-risks.csv' // eslint-disable-line import/no-webpack-loader-syntax

export default {
  name: 'oil-risk',
  props: {
    step: {
      type: Number,
      default: 0
    },
    width: {
      type: Number,
      default: 0
    },
    height: {
      type: Number,
      default: 0
    }
  },
  data () {
    return {
      // PrEnQuantity,
      margins: {
        risks,
        marginleft: 65,
        marginright: 30
      }
    }
  },
  computed: {
    innerWidth () {
      const { width } = this
      return Math.min(width, 1000)
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "library/src/style/variables.scss";

.oil-risk {
  display: flex;
  align-items: center;
  flex-direction: column;

  svg {
    background: getColor(red, 100);
  }
}</style>
