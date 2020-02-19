<template>
<<<<<<< HEAD
  <div class="third_graph">
  <div class="oil">
    <svg :data="groupData">

   </svg>
  </div>
=======
  <div class="oil-risk">
    <svg :width="innerWidth" :height="height"></svg>
>>>>>>> 2e6be64438ed435d57f6645322fd38cfaad19d7e
</div>
</template>

<script>
// import * as d3 from 'd3'
<<<<<<< HEAD
import _ from 'lodash'
=======
// import _ from 'lodash'
>>>>>>> 2e6be64438ed435d57f6645322fd38cfaad19d7e

import risks from 'dsv-loader!@/assets/data/oil-risks.csv' // eslint-disable-line import/no-webpack-loader-syntax

export default {
<<<<<<< HEAD
  name: 'OilRisk',
=======
  name: 'oil-risk',
>>>>>>> 2e6be64438ed435d57f6645322fd38cfaad19d7e
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
        marginright: 65
      }
    }
  },
  computed: {
<<<<<<< HEAD
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
=======
    innerWidth () {
      const { width } = this
      return Math.min(width, 1000)
>>>>>>> 2e6be64438ed435d57f6645322fd38cfaad19d7e
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "library/src/style/variables.scss";

.oil-risk {
  display: flex;
<<<<<<< HEAD
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
=======
  align-items: center;
  flex-direction: column;

  svg {
    background: getColor(red, 100);
  }
}</style>
>>>>>>> 2e6be64438ed435d57f6645322fd38cfaad19d7e
