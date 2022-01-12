<template>
  <div id="NewGame.vue">
    <div class="cardContainer">
      <div class="card">
        <span>One Word</span>
      </div>
    </div>
    <div class="cardContainer">
      <div class="card">
        <div>Poem</div>
      </div>
    </div>
    <div class="cardContainer">
      <div class="card">
        <div>Short Story</div>
      </div>
    </div>
    <div class="cardContainer">
      <div class="card">
        <div>Novel</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'NewGame',
  // props: {
  //    cta: String,
  // }
};
</script>

<style lang="scss" scoped>
  @import 'application.scss';

  .cardContainer {
    padding: 5px;
    display: inline-block;
  }

  .card {
    background-color: $whiteSpace;
    border-radius: 5px;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 5px;
    height: 125px;
    width: 100px;
    text-align: center;
    border: 1px solid $medBlue;
  }

  .card:hover {
    cursor: pointer;
    border: 1px solid $lightOrange;
  }
</style>
