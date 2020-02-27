<template>
  <div id="app">
    <SensesMenu />
    <div class="noscroll">
      <h1 class="t" id="cover">Fossil Fuels Risks</h1>
      <h1 class="subtitle">Why you shouldn't invest in fossil fuels in the next 100 years</h1>
      <h2 class="title" id="quantity">What kind of risks are we talking about?</h2>
      <p>
        We live in a society heavily relying on fossil fuels, mitigation
        strategies due to climate change will force us to change our model.
        <br />
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
        veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
        commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
        velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
        occaecat cupidatat non proident, sunt in culpa qui officia deserunt
        mollit anim id est laborum.
      </p>
    </div>
    <LayoutScrollytelling>
      <template v-slot:vis="{ width, height, step }">
        <div
          class="vis-inner"
          :style="{
            width: `${width}px`,
            height: `${height}px`
          }">
          <GeneralRisks :step="step" :width="width" :height="height"/>
        </div>
      </template>
      <div slot="text" class="observer">
        <IntersectionObserver :step="0">
          <p>hey!</p>
        </IntersectionObserver>
        <IntersectionObserver :step="1">
          <p>hey!</p>
        </IntersectionObserver>
        <IntersectionObserver :step="2">
          <p>hey!</p>
        </IntersectionObserver>
        <IntersectionObserver :step="3">
          <p>hey!</p>
        </IntersectionObserver>
        <IntersectionObserver :step="4">
          <p>hey!</p>
        </IntersectionObserver>
        <IntersectionObserver :step="5">
          <p>hey!</p>
        </IntersectionObserver>
      </div>
    </LayoutScrollytelling>
    <div class="noscroll">
      <h2 class="title" id="quantity">What will happen to Coal production in the future?</h2  >
      <p class="paragraph">
        We live in a society heavily relying on fossil fuels, mitigation
        strategies due to climate change will force us to change our model.
        <br />
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
        veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
        commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
        velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
        occaecat cupidatat non proident, sunt in culpa qui officia deserunt
        mollit anim id est laborum.
      </p>
    </div>
    <div class="command">
     </div>
    <LayoutScrollytelling>
      <template v-slot:vis="{ width, height, step }">
        <div
          class="vis-inner"
          :style="{
            width: `${width}px`,
            height: `${height}px`
          }">
          <CoalRisk :step="step" :width="width" :height="height"/>
        </div>
      </template>
      <div slot="text" class="observer">
        <IntersectionObserver :step="6"  align="left">
          <p>this would be the quantity of coal burned if no policies will be
            implemented.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="7"  align="left">
          <p>However, if a small package of policies on fossil fuels will
            be implemented there will be a major drop in the quantity of coal
            that could be burned.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="8"  align="left">
          <p>If a strong policy model will be implemented the produced quantity
            will decrease even more. Led investments in coal to be useless.</p>
        </IntersectionObserver>
      </div>
    </LayoutScrollytelling>
    <div class="noscroll">
      <h2 class="title" id="price">Are investments in fossil fuels safe investments?</h2  >
        <p class="paragraph">
        While oil quantity remains stable during time, its price will
        decrease substantially due to taxes.
        In a strong policies scenario, for example, oil will increase its
        quantity on the market, however this will affect negatively revenues.
      </p>
    </div>
    <LayoutScrollytelling>
      <template v-slot:vis="{ width, height, step }">
        <UncertaintyRisk :step="step" :width="width" :height="height"/>
      </template>
      <div slot="text" class="observer">
        <IntersectionObserver :step="0" class="bottom">
          <p>this would be something on uncertainty.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="1" class="bottom">
          <p>this would be more on uncertainty.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="2" class="bottom">
          <p>this would be on uncertainty again.</p>
        </IntersectionObserver>
      </div>
    </LayoutScrollytelling>
    <div class="noscroll">
      <h2 class="title" id="price">Will fossil fuels be heavily depending on price?</h2  >
        <p class="paragraph">
        While oil quantity remains stable during time, its price will
        decrease substantially due to taxes.
        In a strong policies scenario, for example, oil will increase its
        quantity on the market, however this will affect negatively revenues.
      </p>
    </div>
    <LayoutScrollytelling>
      <template v-slot:vis="{ width, height, step }">
        <OilRisk :step="step" :width="width" :height="height"/>
      </template>
      <div slot="text" class="observer">
        <IntersectionObserver :step="0">
          <p>this would be the quantity of coal burned if no policies will be
            implemented.</p>
        </IntersectionObserver>
      </div>
    </LayoutScrollytelling>
    <div class="noscroll">
      <h2 class="title" id="price">Risks and Opportunities in a Fossil Fuels free future</h2  >
        <p class="paragraph">
        While oil quantity remains stable during time, its price will
        decrease substantially due to taxes.
        In a strong policies scenario, for example, oil will increase its
        quantity on the market, however this will affect negatively revenues.
      </p>
      <SensesMeta :id="'transition-risk'"/>
    </div>

  </div>
</template>

<script>
//  from library
import SensesMenu from 'library/src/components/SensesMenu.vue'
import LayoutScrollytelling from 'library/src/components/LayoutScrollytelling.vue'
import IntersectionObserver from 'library/src/components/IntersectionObserver.vue'
import SensesMeta from 'library/src/components/SensesMeta.vue'

//  from project
import GeneralRisks from './components/GeneralRisks.vue'
import CoalRisk from './components/CoalRisk.vue'
import OilRisk from './components/OilRisk.vue'
import UncertaintyRisk from './components/UncertaintyRisk.vue'

export default {
  name: 'app',
  components: {
    SensesMenu,
    SensesMeta,
    GeneralRisks,
    CoalRisk,
    OilRisk,
    LayoutScrollytelling,
    IntersectionObserver,
    UncertaintyRisk
  }
}
</script>

<style lang="scss">
@import "library/src/style/base.scss";
@import "library/src/style/variables.scss";

.noscroll {
  padding-top: $spacing;
  margin: 20px auto;
  max-width: 900px;
  width: 100%;
}

.graph-title {
  font-size: 20px;
  font-weight: bold;
  hyphens: none;
}

.author__section {
  margin-bottom: $spacing;
}

.author {
  font-style: 12px;
  font-weight: bold;
  margin-right: 1em;
  color: $color-neon;
}

#quantity {
  margin-bottom: $spacing;
}

.t {
  font-size: 60px;
  margin-bottom: $spacing / 2;
}

.subtitle {
  font-size: 20px;
  margin-bottom: $spacing * 2;
}

.title {
  border-top: 1px solid black;
  padding-top: $spacing * 2;
  margin-bottom: $spacing;
}

.paragraph {
  margin-bottom: $spacing * 2;
}

.bottom {
  padding-bottom: 50px;
}
</style>
