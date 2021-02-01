<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>

export default {
  data: function() {
    return {
      // message: "Hello Vue!"
    };
  },
  beforeCreate() {
    const existingSession = this.$cookie.get('session')

    if (existingSession && existingSession.length) { // A string at this point
      const session = JSON.parse(existingSession)
      this.$store.commit('user', session.user)
      this.$store.commit('auth', session.tokens)
    } else {
      this.$router.push({ name: 'login' })
    }
  },
};

</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
