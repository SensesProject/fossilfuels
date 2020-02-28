<template>
  <div id="app">
    <SensesMenu />
    <div class="noscroll">
      <h1 class="t" id="cover">Fossil Fuels Risks</h1>
      <h1 class="subtitle">Why you shouldn't invest in fossil fuels in the next 100 years</h1>
      <h2 class="title" id="quantity">What kind of risks are we talking about?</h2>
      <p>
        Our society is currently relying heavily on fossil fuels to provide
        energy to our industries, keep our homes at comfortable temperatures
        and move goods and persons around the globe. However, limiting climate
        change will require us to reduce the emission of greenhouse gasses and
        by phasing out the use of fossil fuels. As a result, the demand for fossil
        fuels will evolve differently in the future than what we have seen in the
        past. This has consequences for investors in the fossil fuel sector.<br /><br />
        In this module we show the change in risks associated with investing
        in the fossil fuel sector to explain why investors should consider climate
        policy in their decisions.
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
          <p>Currently society is using large amounts of coal, oil and gas</p>
        </IntersectionObserver>
        <IntersectionObserver :step="1">
          <p>To limit climate change, fossil need to be phased out</p>
        </IntersectionObserver>
        <IntersectionObserver :step="2">
          <p>Coal is the most carbon intensive fossil fuel and will be phased
            out first. Oil use will be drastically reduced, but there may be
            a long-term role for natural gas in the energy system. </p>
        </IntersectionObserver>
        <IntersectionObserver :step="3">
          <p>Quantity risk: reduced use of fossil fuels</p>
        </IntersectionObserver>
        <IntersectionObserver :step="4">
          <p>Uncertainty risk: the future role of oil and natural gas depends on
            other developments in the energy system</p>
        </IntersectionObserver>
        <IntersectionObserver :step="5">
          <p>Price risk: the direction of fossil fuel price changes under climate
            policy is unceratain</p>
        </IntersectionObserver>
      </div>
    </LayoutScrollytelling>
    <div class="noscroll">
      <h2 class="title" id="quantity">Quantity risk: phasing out coal</h2>
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
          <p>Without climate policy, coal would be a very cheap energy use to
            fuel our economies and its use would be expected to expand into the future.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="7"  align="left">
          <p>However, if we want to limit climate change to 2 degrees, we need
            to phase out coal from our energy systems within a few decades</p>
        </IntersectionObserver>
        <IntersectionObserver :step="8"  align="left">
          <p>When limiting climate change to 1.5 degrees, the phase out of coal
            will be even faster</p>
        </IntersectionObserver>
      </div>
    </LayoutScrollytelling>
    <div class="noscroll">
      <h2 class="title" id="price">Uncertainty risk: different trends for oil and natural gas</h2>
        <p class="paragraph">
        While it is clear that coal is phase out quickly with climate policies,
        different scenarios and model diverge on the role of oil and natural gas.
        Here we show the agreement between models on the trends of coal,
        oil and gas use under different levels of climate policy.
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
          <p>The rate of change for oil and natural gas varies widely between
            models and scenario for the next few decades.</p>
        </IntersectionObserver>
      </div>
    </LayoutScrollytelling>
    <div class="noscroll">
      <h2 class="title" id="price">Price risk: revenue of the fossil fuel sector
        depends on price development</h2  >
        <p class="paragraph">
        Even though oil and natural gas could still be used in a low-carbon energy
        system, their volumes are reduced, and the total revenue of these sectors
        in the future will depend strongly on the price. If prices increase,
        the total revenue of the sector might still remain large, even though
        the volume of fossil fuel use is reduced.
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
