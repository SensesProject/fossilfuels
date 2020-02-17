<template>
  <div id="app">
    <SensesMenu />
    <div class="noscroll">
      <h1 class="title" id="cover">Fossil Fuels Risks</h1>
      <p class="author__section">
        <span class="tiny uppercase mono">Content:</span> <span class="tiny author mono">Ipsum L.</span>
        <span class="tiny uppercase mono">Design:</span> <span class="tiny author mono">Ipsum L.</span>
        <span class="tiny uppercase mono">Code:</span> <span class="tiny author mono">Ipsum L.</span>
      </p>
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
           }"
        >
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
      <h2 class="title" id="quantity">Quantity Risk - Coal</h2  >
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
    <LayoutScrollytelling>
          <template v-slot:vis="{ width, height, step }">
            <div
              class="vis-inner"
              :style="{
                 width: `${width}px`,
                height: `${height}px`
               }"
            >
            <CoalRisk :step="step" :width="width" :height="height"/>
            </div>
          </template>
          <div slot="text" class="observer">
          <IntersectionObserver :step="6">
            <p>this would be the quantity of coal burned if no policies will be
              implemented.</p>
          </IntersectionObserver>
          <IntersectionObserver :step="7">
            <p>However, if a small package of policies on fossil fuels will
              be implemented there will be a major drop in the quantity of coal
              that could be burned.</p>
          </IntersectionObserver>
          <IntersectionObserver :step="8">
            <p>If a strong policy model will be implemented the produced quantity
              will decrease even more. Led investments in coal to be useless.</p>
          </IntersectionObserver>
        </div>
        </LayoutScrollytelling>
        <div class="noscroll">
          <h2 class="title" id="price">Price Risk - Oil</h2  >
          <p>
            While oil quantity remains stable during time, its price will
            decrease substantially due to taxes.
            In a strong policies scenario, for example, oil will increase its
            quantity on the market, however this will affect negatively revenues.
          </p>
        </div>
        <LayoutScrollytelling>
              <template v-slot:vis="{ width, height, step }">
                <div
                  class="vis-inner"
                  :style="{
                     width: `${width}px`,
                    height: `${height}px`
                   }"
                >
                <OilRisk :step="step" :width="width" :height="height"/>
                </div>
              </template>
              <div slot="text" class="observer">
              <IntersectionObserver :step="9">
                <p>this would be the quantity of coal burned if no policies will be
                  implemented.</p>
              </IntersectionObserver>
            </div>
            </LayoutScrollytelling>
  </div>
</template>

<script>
//  from library
import SensesMenu from 'library/src/components/SensesMenu.vue'
import LayoutScrollytelling from 'library/src/components/LayoutScrollytelling.vue'
import IntersectionObserver from 'library/src/components/IntersectionObserver.vue'

//  from project
import GeneralRisks from './components/GeneralRisks.vue'
import CoalRisk from './components/CoalRisk.vue'
import OilRisk from './components/OilRisk.vue'

export default {
  name: 'app',
  components: {
    SensesMenu,
    GeneralRisks,
    CoalRisk,
    OilRisk,
    LayoutScrollytelling,
    IntersectionObserver
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

.paragraph {
  margin-bottom: $spacing * 2;
}
</style>
