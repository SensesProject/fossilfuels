<template>
  <div>
    <p class="graph-title">Fossil Fuels volatily ($/year)</p>
    <p>How to read:</p>
  <svg id="square">
    <g :transform="`translate(${marginleft}, ${margintop})`">
      <rect id="empty" ref="rect"/>
      <rect id="filled" />
      <text id="revenue" x="2" y="58">Revenue</text>
      <text id="costs" x="2" y="85">Costs</text>
    </g>
  </svg>
  <svg>
    <g :transform="`translate(${marginleft}, ${margintop})`"></g>
    <rect class="carrier Coal" x="2" y="2"/>
    <text x="25" y="14">Coal</text>
    <rect class="carrier Gas" x="2" y="30"/>
    <text x="25" y="44">Gas</text>
    <rect class="carrier Oil" x="2" y="60"/>
    <text x="25" y="74">Oil</text>
  </svg>
</div>
</template>

<script>
export default {
  name: 'OilLegend',
  data () {
    return {
      margintop: 2,
      marginleft: 2,
      revX: 0,
      revY: 0,
      chartWidth: 0,
      chartHeight: 0
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "library/src/style/global.scss";

svg {
  width: calc(128px - 2rem);
  height: calc(128px);

  $size-out: calc(128px - 2.5rem);
  $size-in: calc(128px - 4rem);
  #empty {
      width: $size-out;
      height: $size-out;
      stroke: black;
      fill: none;
    }

  #filled {
    width: $size-in;
    height: $size-in;

    stroke: none;
    fill: black;
  }

  text {
    font-size: 12px;
  }

  #revenue {
    fill: white;
  }

  .carrier {
    width: calc(128px / 8);
    height: calc(128px / 8);
  }

  #coal {
    fill: gray;
  }

  #oil {
    fill: orange;
  }

  #gas {
    fill: red;
  }

  rect {
    fill: none;

    &.Coal {
      stroke: getColor(gray, 40);
      fill: getColor(gray, 80);
     }

    &.Oil {
      stroke: getColor(orange, 40);
      fill: getColor(orange, 80);
    }

    &.Gas {
      stroke: getColor(red, 40);
      fill: getColor(red, 80);
    }
  }
}

@include max-width($narrow) {
  svg {
    overflow: hidden;
    &#square{
    margin-left: 110px;
    margin-right: 20px;
    }
  }

  p {
    position: absolute;
  }
}
</style>
