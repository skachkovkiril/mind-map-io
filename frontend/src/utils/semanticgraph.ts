import Graph from "graphology";
import Sigma from "sigma";
import { getSemanticGraph } from "./get_semanticgraph";
import ForceSupervisor from "graphology-layout-force/worker";

export async function createGraph(container: any) {
  const graph = new Graph();
  const data = await getSemanticGraph();
  graph.import(data);
  graph.nodes().forEach((node, i) => {
    const angle = (i * 2 * Math.PI) / graph.order;
    graph.setNodeAttribute(node, "x", 100 * Math.cos(angle));
    graph.setNodeAttribute(node, "y", 100 * Math.sin(angle));
  });
  new ForceSupervisor(graph).start();
  new Sigma(graph, container, {
    renderEdgeLabels: true,
    allowInvalidContainer: true,
  });
}
