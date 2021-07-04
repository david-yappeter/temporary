<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <span class="nav-link disabled" href="#">
            Fancy Quiz App<span class="sr-only">(current)</span>
          </span>
        </li>
        <li class="nav-item">
          <span class="nav-link disabled" href="#"
            >Counter : {{ numCorrect }}/{{ numTotal }}
          </span>
        </li>
      </ul>
    </nav>
  </div>
</template>

<script>
export default {
  props: ["numCorrect", "numTotal"],
};
</script>
