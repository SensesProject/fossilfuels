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
        <GeneralRisks v-if="step <= 3" :step="step" :width="width" :height="height"/>
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

export default {
  name: 'app',
  components: {
    SensesMenu,
    GeneralRisks,
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
  margin: 0 auto;
  max-width: 600px;
  width: 100%;
  height: 200px;
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
</style>
