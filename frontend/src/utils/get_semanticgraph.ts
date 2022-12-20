export function getSemanticGraph() {
  const headersList = { Accept: "*/*" };
  const response = fetch("http://127.0.0.1:8000/semantic-graph", {
    method: "GET",
    headers: headersList,
  }).then((data) => data.json());
  return response;
}
