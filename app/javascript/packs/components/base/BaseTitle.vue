<template>
  <h1 id="Title.vue" class="title">{{ text }}</h1>
</template>

<script>
   export default {
      name: 'BaseTitle',
      props: {
        text: {
          type: String,
          required: true,
        },
      },
   };
</script>

<style lang="scss" scoped>
  @import 'application.scss';

  .title {
    padding-top: 0;
    padding-bottom: 0;
    margin-bottom: 0;
    color: $darkBlue;
    font-family: serif;
    font-weight: normal;
    margin-bottom: 25px;
  }
</style>
