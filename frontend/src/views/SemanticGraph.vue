<template>
  <div class="home">
    <div class="sigma" ref="sigma"></div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { createGraph } from "@/utils/semanticgraph";

export default defineComponent({
  name: "SemanticGraph",
  async mounted() {
    await createGraph(this.$refs.sigma);
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
