<template>
  <div id="BaseButton.vue">
    <button @click="onClick" class="btn">
      {{ cta }}
    </button>
  </div>
</template>

<script>
export default {
  name: 'BaseButton',
  props: {
    cta: {
      type: String,
      required: true,
    },
    onClick: {
      type: Function,
      required: true,
    },
  }
};
</script>

<style lang="scss" scoped>
   @import 'application.scss';
   .btn {
      -webkit-border-radius: 3px;
      -moz-border-radius: 3px;
      border-radius: 3px;
      color: $darkOrange;
      font-family: Arial;
      font-size: 15px;
      line-height: 20px;
      width: 100%;
      padding: 10px;
      background-color: $whiteSpace;
      border: solid $darkOrange 1px;
      text-decoration: none;
      display: inline-block;
      cursor: pointer;
      text-align: center;
   }
</style>
