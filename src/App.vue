<template>
  <div id="app">
    <SensesMenu :id="'transition-risk'" :minWidth="'768'"/>
    <div class="noscroll">
      <h1 class="t" id="cover">Transition Risks – Phasing Out Fossil Fuels</h1>
      <h1 class="subtitle">Risks associated with investing in fossil fuel assets</h1>
      <p>This is the first chapter of the Finance Risks Pathway.
      You can select another chapter below.</p>
      <div class="risk-card">
        <nav class="risk-menu pathway">
          <section>
            <a class="wrapper active">
              <div><span class="glyph-oil"/></div>
              <div><span class="coming reading">Now reading</span><h4>Chapter 1</h4><span>Fossil Fuels</span></div>
            </a>
          </section>
          <section>
            <a class="wrapper" href="#">
              <div><span class="glyph-power"/></div>
              <div><span class="coming soon">Coming Soon</span><h4 class="soon">Chapter 2</h4><span class="soon">Power Sector&nbsp;&nearr;</span></div>
            </a>
          </section>
          <section>
            <a class="wrapper" href="#">
              <div><span class="glyph-building"/></div>
              <div><span class="coming soon">Coming Soon</span><h4 class="soon">Chapter 3</h4><span class="soon">End Use&nbsp;&nearr;</span></div>
            </a>
          </section>
        </nav>
      </div>
      <h2 id="quantity">What risks will be discussed?</h2>
      <p>
        Our society is currently relying heavily on fossil fuels to provide energy
        to our industries, keep our homes at comfortable temperatures and move
        goods and persons around the globe. However, limiting climate change
        will require us to reduce the emission of greenhouse gasses by reducing
        the use of fossil fuels. As a result, the demand for fossil fuels will
        evolve differently in the future than what we have seen in the past.
        This has consequences for the risk of investing in the fossil fuel sector.<br/><br/>
        In this module we show the risks associated with investing in the fossil
        fuel sector to explain why investors should consider climate policy in their decisions.
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
          <p>Currently, society is using large amounts of coal, oil and gas.
            This is happening across all sectors worldwide: we heavily rely on fossil fuels.
            What will happen if climate policies will be implemented?</p>
        </IntersectionObserver>
        <IntersectionObserver :step="1">
          <p>As fossil fuel use is the major source of greenhouse gas emissions,
            their use needs to be reduced, or even phased out to limit climate change.
            This can be done through policies to regulate and/or tax the use of
            carbon intensive fuels.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="2">
          <p>As we can see in the figure: coal is the most carbon intensive
            fossil fuel and is phased out first in climate change mitigation
            scenarios. Oil use will be drastically reduced as well in the next
            decades, less certain but still transitioning is natural gas,
            that may have a long-term role in the energy system.  </p>
        </IntersectionObserver>
        <IntersectionObserver :step="3" align="right">
          <p>The world is in a phase of abandoning fossil fuels. As fossil fuels,
            especially coal, will be produced and used drastically less than now,
            this results in a so-called quantity risk.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="4" align="right">
          <p>While for certain fossil fuels (such as coal) a strong decline in use
            is very likely to happen, the future role of oil and natural gas
            depends on various developments in the energy system, making it very
            difficult to predict their use in the future. Therefore, investors
            will face an uncertainty risk.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="5" align="right">
          <p>Finally, revenue risks will be explored: as the price of fossil fuels
            becomes even less predictable than historically, revenues for the
            sector can change faster or slower than the physical changes in
            fossil fuel use, leading to lower profits or even losses for investors.</p>
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
          <p>In a scenario with no climate policies, coal would be relatively
            cheap and its use would be expected (in the majority of cases) to
            expand even further in the future. </p>
        </IntersectionObserver>
        <IntersectionObserver :step="7"  align="left">
          <p>However, if we want to limit climate change to 2 degrees, we need
            to phase out coal from our energy systems within a few decades.
            This can happen through a carbon tax or through more direct policy measures.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="8"  align="left" class="changeheight">
          <p>When introducing stronger policies, coal dramatically drops even faster before 2050.
            Investors must therefore be aware that coal as well as other fossil
            fuels assets may have the potential to become stranded assets.</p>
        </IntersectionObserver>
      </div>
    </LayoutScrollytelling>
    <div class="noscroll">
      <h2 class="title" id="price">Uncertainty risk: different trends for oil and natural gas</h2>
        <p class="paragraph">
        While it is clear that coal is phased out quickly only by introducing
        mild climate policies, scenarios developed with different models diverge
        on the role of oil and natural gas. The future role of these energy sources
        under climate policies depends on various developments such as the development
        of alternative technologies (electric cars, heat pumps) or the role of flexible
        gas power plants in the integration of renewable energy in the power grid.
        Investors are confronted with fundamental uncertainties about future trends
        in these fuels, as can be seen in the figure below. <br/><br/>
        Here agreement between models is visualized – one beam represents a trend in primary energy quantity
        at a different level of climate policy. Trends can be increasing,
        fairly neutral or decreasing based on the model assumptions and methods.
        Simply put, the more overlaying beams differ between each other,
        the greater the disagreement between models, hence a higher degree of uncertainty.
      </p>
    </div>
    <LayoutScrollytelling>
      <template v-slot:vis="{ width, height, step }">
        <UncertaintyRisk :step="step" :width="width" :height="height"/>
      </template>
      <div slot="text" class="observer">
        <IntersectionObserver :step="0">
          <p> Let's build the visualization stepwise. If we look at the 2.0ºC scenario
          (NPi2020_1000_V3 / model:REMIND) we can observe a general decreasing trend in fossil fuels quantities.
          However not all scenarios behave in the same way: trends variate according to implemented policies.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="1">
          <p>If we add to the mix other models it becomes even clearer how uncertain
            the future of fossil fuels is.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="2">
            <p>In the long run, the uncertainty
            between different models reduces, as they agree on the need to phase
            out oil and gas in the second half of the century.
            To switch models you can use the selector on the bottom left side of
            the screen.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="3" class="changeheight">
          <p>The rate of change for oil and natural gas varies widely between
            models and scenarios for the next few decades. For the financial
            world this means that different predictions and high disagreement
            between models can lead to wrong decision making that negatively
            impact investments.</p>
        </IntersectionObserver>
      </div>
    </LayoutScrollytelling>
    <div class="noscroll">
      <h2 class="title" id="price"> Revenue risk: the fossil fuel sector depends on price developments</h2>
        <p class="paragraph">
        As seen above, the trends in fossil fuel use show that oil
        and natural gas could still be used for several decades in a low-carbon
        energy system. However, in the long run, a reduction in volume should
        still be expected. The effects of these trends on the price of fossil
        fuels are hard to predict and these will directly affect revenue of the
        fossil fuel sectors.<br/><br/>
        The visualization below shows the trend of fossil fuels revenues across
        different scenarios and regions. Despite a first grow for oil, in the long
        run we will witness a drastic shrink in revenue.
      </p>
    </div>
    <LayoutScrollytelling>
      <template v-slot:vis="{ width, height, step }">
        <OilRisk :step="step" :width="width" :height="height"/>
      </template>
      <div slot="text" class="observer">
        <IntersectionObserver :step="0">
          <p>The smaller the squares, the smaller the revenue from fossil fuels
          under different scenarios.</p>
        </IntersectionObserver>
        <IntersectionObserver :step="1" class="changeheight">
          <p>Strong variations in price and quantities are factors that negatively impact
          investments on a medium and long term.</p>
        </IntersectionObserver>
      </div>
    </LayoutScrollytelling>
    <div class="noscroll">
      <h2 class="title" id="price">Assessing risks with the help of climate scenarios</h2  >
        <p class="paragraph">
          We have seen that climate  policies will strongly impact fossil fuels
          quantities and revenues over the next decades. Navigating through the
          resulting uncertainty and risks is a complex task.
          However, climate scenarios can help us understand the timing of such
          transitions by providing a detailed and differentiated projection of
          future transitions.
          It is vital for investors and financial analysts to acknowledge and
          navigate through climate scenarios to understand the challenges of
          this ongoing transition.
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
  font-size: 40px;
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
  margin-top: $spacing;
}

.pathway {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  max-width: 1100px;
  flex-direction: column;

  a {
    text-decoration: none;
    background: none;
    color: #000;
  }

  .active {
    color: #B035C9;
  }

  .risk-menu {
    display: flex;
  }

  .intro {
    display: flex;
    grid-template-columns: repeat(1, 1fr);
  }

  .wrapper {
    padding: $spacing / 2 $spacing / 1.5 $spacing / 2 0;
    display: flex;
    align-items: center;
    width: 100%;
    height: 100%;
  }

  .coming {
    font-style: italic;
    font-size: 12px;
  }

  .soon {
    color: $color-gray;
  }

  .glyph-building, .glyph-oil, .glyph-power {
    font-size: 5rem;
  }

  .glyph-oil, .reading {
    color: #B035C9;
  }

  .glyph-building, .glyph-power {
    color: #d8d8e4;
  }
}

@include max-width(950px) {
  .noscroll {
    max-width: 700px;
  }

  .vis {
    width: 90%;
  }
  .command {
    width: 80%;
  }
}
</style>
