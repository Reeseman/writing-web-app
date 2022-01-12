<template>
  <div id="Setting.vue">
    <span>Your email: {{ user.email }}</span>
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
