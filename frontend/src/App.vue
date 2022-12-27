<template>
  <div class="container">
    <header class="py-3 px-0">
      <div
        class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start"
      >
        <ul
          class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0"
        >
          <li class="nav-item">
            <router-link
              to="/glossary"
              class="nav-link"
              active-class="text-secondary"
              >Глоссарий</router-link
            >
          </li>
          <li class="nav-item">
            <router-link
              to="/semantic-graph"
              class="nav-link"
              active-class="text-secondary"
              >Семантический граф</router-link
            >
          </li>
        </ul>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
          <input
            type="search"
            class="form-control form-control-dark"
            placeholder="Поиск..."
            aria-label="Поиск"
          />
        </form>
      </div>
    </header>
    <router-view />
  </div>
</template>

<style>
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.nav-link {
  color: white;
}
.nav-link:hover {
  color: #00b060;
}
</style>
