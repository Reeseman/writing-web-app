<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>

export default {
  data: function() {
    return {
    };
  },
  beforeCreate() {
    const existingSession = this.$cookie.get('session')

    if (existingSession && existingSession.length && JSON.parse(existingSession) != null) {
      const session = JSON.parse(existingSession)
      console.log("current session: " + session);
      this.$store.commit('user', session.user)
      this.$store.commit('auth', session.tokens)
      this.$router.push({ name: 'dashboard' })
    } else {
      this.$router.push({ name: 'login' }).catch(err => {
        // Ignore the vuex err regarding  navigating to the page they are already on.
        if (
          err.name !== 'NavigationDuplicated' &&
          !err.message.includes('Avoided redundant navigation to current location')
        ) {
          // But print any other errors to the console
          console.error(err);
        }
      });
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
