<template>
  <div class="home">
    <div class="sigma" ref="sigma"></div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { createGraph } from "@/utils/semanticgraph";
import ForceSupervisor from "graphology-layout-force/worker";
import Graph from "graphology";

export default defineComponent({
  name: "SemanticGraph",
  components: {},
  data() {
    return {
      layout: new ForceSupervisor(new Graph()),
    };
  },
  async mounted() {
    await createGraph(this.$refs.sigma).then((x) => (this.layout = x));
  },
  async beforeUnmount() {
    this.layout.stop();
  },
});
</script>

<style scoped>
.sigma {
  background-color: white;
  min-height: 580px;
  height: 100%;
  border: 1px solid black;
  border-radius: 10px;
}
</style>
