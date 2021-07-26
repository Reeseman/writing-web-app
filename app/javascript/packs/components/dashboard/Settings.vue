<template>
  <div id="NewGame.vue">
    <span>{{ this.email }}</span>
  </div>
</template>

<script>
  export default {
    name: 'Settings',

    props: {
      email: {
        type: String,
        default: 'write',
        required: true
      }, 
    }
  };
</script>

<style lang="scss" scoped>
  @import 'application.scss';
</style>
