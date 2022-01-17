<template>
  <div id="NewGame.vue">
    <span>Your email: {{ this.user.email }}</span>
  </div>
</template>

<script>
  export default {
    name: 'Settings',

    props: {
      user: {
        type: Object,
        required: true
      }, 
    }
  };
</script>

<style lang="scss" scoped>
  @import 'application.scss';
</style>
