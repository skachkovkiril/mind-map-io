export function getGlossary() {
  const headersList = { Accept: "*/*" };
  const response = fetch("http://127.0.0.1:8000/glossary/list_of_dict", {
    method: "GET",
    headers: headersList,
  }).then((data) => data.json());
  return response;
}
