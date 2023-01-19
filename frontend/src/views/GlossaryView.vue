<template>
  <div class="home">
    <form class="my-3" v-on:submit.prevent>
      <input
        type="search"
        v-model="term"
        class="form-control form-control-dark"
        placeholder="Поиск..."
        aria-label="Поиск"
        v-on:keydown.enter="search"
      />
    </form>
    <div v-if="response_data.length != 0">
      <div
        v-for="item in response_data"
        :key="item['term']"
        class="card text-bg mb-3"
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
    <div v-else>По запросу "{{ searching }}" терминов не найдено</div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { getGlossary, getTerm } from "@/utils/get_glossary";

export default defineComponent({
  name: "GlossaryView",
  data() {
    return {
      response_data: [],
      term: "",
      searching: "",
    };
  },
  async mounted() {
    this.response_data = await getGlossary();
  },
  methods: {
    search: async function () {
      this.searching = this.term;
      this.response_data = await getTerm(this.term);
    },
  },
});
</script>

<style scoped>
.card {
  background-color: #ffffff1f;
  border: 1px solid #ffffff1c;
}
</style>
