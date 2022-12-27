<template>
  <div class="home">
    <div
      v-for="item in response_data"
      :key="item['term']"
      class="card text-bg-secondary mb-3"
      style="max-width: 100%"
    >
      <div class="card-header">{{ item["term"] }}</div>
      <div class="card-body">
        <p class="card-text">
          {{ item["definition"] }}
        </p>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { getGlossary } from "@/utils/get_glossary";

export default defineComponent({
  name: "GlossaryView",
  components: {},
  data() {
    return {
      response_data: JSON,
    };
  },
  async mounted() {
    this.response_data = await getGlossary();
  },
});
</script>
