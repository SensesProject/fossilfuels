<template>
  <div class="third_graph">
  <div class="oil">
    <svg :data="groupData">

   </svg>
  </div>
</div>
</template>

<script>
// import * as d3 from 'd3'
import _ from 'lodash'

import PrEnQuantity from '../assets/data/PrimaryEnergyQuantity.json'

export default {
  name: 'OilRisk',
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
      PrEnQuantity,
      margins: {
        marginleft: 65,
        marginright: 65
      }
    }
  },
  computed: {
    svgWidth () {
      return this.width - this.width / 2
    },
    chartHeight () {
      return this.height - this.height / 3
    },
    groupData () {
      const primaryenergy = this.PrEnQuantity
      const groupVariable = _.groupBy(primaryenergy, 'variable')
      console.log(groupVariable['primenOil'])
      return groupVariable['primenOil']
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "library/src/style/variables.scss";

.third_graph {
  margin: 0 auto;
  padding-top: 30px;
  max-width: 900px;
  width: 100%;
}

.oil {
  margin: 0 auto;
  display: flex;
  max-width: 1000px;
  width: 100%;
  height: 90vh;
}

svg {
  width: 100%;
  height: 90%;

  display: block;
  margin: 0 auto;

  background-color: lightblue;
}
</style>
