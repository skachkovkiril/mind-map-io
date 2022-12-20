import { createRouter, createWebHistory, RouteRecordRaw } from "vue-router";
import GlossaryView from "../views/GlossaryView.vue";
import SemanticGraphVue from "../views/SemanticGraph.vue";

const routes: Array<RouteRecordRaw> = [
  {
    path: "/glossary",
    name: "glossary",
    component: GlossaryView,
  },
  {
    path: "/semantic-graph",
    name: "sematic graph",
    component: SemanticGraphVue,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
