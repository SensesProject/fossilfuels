<template>
  <div id="app">
    <SensesMenu />
    <div class="noscroll">
      <h1 class="t" id="cover">Transition Risk - Fossil Fuels</h1>
      <h1 class="subtitle">From pricing carbon and phasing out fossil fuels</h1>
      <div class="risk-card">
        <span class="glyph-hurricanes"/><h2>Transition Risk Pathway</h2>
      <span>
        This module is part 1 of 3 in the "Transition Risks Pathway"
      </span>
      </div>
      <h2 id="quantity">What kind of risks are we talking about?</h2>
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
      <p class="paragraph">
        All fossil fuels will be prone to risks. However, specific risks can be
        visualized through examples. The first risk that will be examinated,
        for example, is related to quantity and can be easily explained by looking
        at coal.
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
        <IntersectionObserver :step="0">
          <p>Let's build this visualization stepwise. If we look at the 2.0ºC scenario
            (PEP_2C_ref_eff / model:REMIND) we can observe a general decreasing trend in fossil fuels
            quantities. However not all scenarios behave in the same way: trends variate according
            to implemented policies.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="1">
          <p>If we add to the mix different models it's even clearer how uncertain is fossil fuels future:
          different predictions and high disagreement between models  can negatively impact investments.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="2" class="changeheight">
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
          <p>The wider the gap between colored and empty squares, the more fossil fuels
          will be price dependent in the future.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="1" class="changeheight">
          <p>Strong variations in price and quantities are factors that negatively impact
          investments on a medium and long term.</p>
        </IntersectionObserver>
      </div>
    </LayoutScrollytelling>
    <div class="noscroll">
      <h2 class="title" id="price">Risks and Opportunities in a Fossil Fuels free future</h2  >
        <p class="paragraph">
        Navigating through uncertainty and risks is a complex task. Climate change will impact
        greatly fossil fuels quantity and revenues in the next decades. It is vital to consider
        climate scenarios when deciding future investments.
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
  padding-top: $spacing * 2;
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

.changeheight {
  padding: 80vh 0 250vh !important;
}

.risk-card {
  border: 1px solid #d8d8e4;
  padding: $spacing;
  border-radius: 4px;
  display: grid;

  .glyph-hurricanes {
    font-size: 8em;
    color: #B035C9;
  }
}
</style>
