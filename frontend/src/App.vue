<template>
  <div class="container">
    <header class="d-flex justify-content-center py-3">
      <ul class="nav nav-pills">
        <li class="nav-item">
          <router-link to="/glossary" class="nav-link" active-class="active"
            >Глоссарий</router-link
          >
        </li>
        <li class="nav-item">
          <router-link
            to="/semantic-graph"
            class="nav-link"
            active-class="active"
            >Семантический граф</router-link
          >
        </li>
      </ul>
    </header>
    <!-- <nav>
    <router-link to="/glossary">Глоссарий</router-link>
    <router-link to="/semantic-graph">Семантический граф</router-link>
  </nav> -->
    <router-view />
  </div>
</template>

<style>
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
</style>
