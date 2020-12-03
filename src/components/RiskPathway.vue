<template>
  <div class="risk-card" :class="mobile ? 'mobileCard' : 'desktopCard'">
    <div class="other-chapters">
    </div>
    <nav class="risk-menu pathway">
      <section>
        <div class="wrapper active">
          <div class="svg fossils"></div>
          <div><p>Chapter 1</p><span>Fossil Fuels</span></div>
        </div>
      </section>
      <section>
        <a class="wrapper" href="https://climatescenarios.org/power-sector/" target="_blank">
          <div class="svg power"></div>
          <div ><p>Chapter 2</p><span>Power Sector&nbsp;&nearr;</span></div>
        </a>
      </section>
      <section>
        <a class="wrapper" href="https://climatescenarios.org/end-use/" target="_blank">
          <div class="svg enduse"></div>
          <div ><p>Chapter 3</p><span>End-Use&nbsp;&nearr;</span></div>
        </a>
      </section>
    </nav>
  </div>
</template>

<script>
export default {
  name: 'RiskPathway',
  props: {
    mobile: {
      type: Boolean,
      default: false
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "library/src/style/variables.scss";

.risk-card {
  padding: $spacing*1.5;
  border-radius: 4px;
  background-color: rgba(221,214,255,.3);

  .other-chapters {
    text-align: center;
    font-size: 11px;
  }
}

.pathway {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  max-width: 1100px;
  flex-direction: column;
  a {
    text-decoration: none;
    background: none;
    //color: getColor(neon, 60);
    }

  .active {
    color: getColor(violet, 40);
  }

  .risk-menu {
    display: flex;
  }

  .intro {
    display: flex;
    grid-template-columns: repeat(1, 1fr);
  }
  .wrapper {
    padding: 0 $spacing / 1.5 $spacing / 2 0;
    display: flex;
    align-items: center;
    width: 100%;
    height: 100%;
    outline: none;

      div.svg {
        display: block;
        background-size: 80px 80px;
        width: 80px;
        height: 80px;
        color: getColor(violet, 40);
        &.fossils
        {filter: invert(18%) sepia(19%) saturate(6441%) hue-rotate(234deg) brightness(92%) contrast(91%);
          background-image: url('~@/assets/img/fossils.svg');
        }
        &.power
        {filter: invert(30%) sepia(91%) saturate(2513%) hue-rotate(227deg) brightness(106%) contrast(102%);
          background-image: url('~@/assets/img/power.svg');
        }
        &.enduse
        {filter: invert(30%) sepia(91%) saturate(2513%) hue-rotate(227deg) brightness(106%) contrast(102%);
          background-image: url('~@/assets/img/enduse.svg');
        }
      }
  }
}

.mobileCard {
  margin: 20px;
  .pathway {
    grid-template-columns: repeat(1, 1fr);

    .wrapper {
      padding: $spacing;
    }

    section {
      height: 50%;
      display: grid;
    }
  }
}

</style>
