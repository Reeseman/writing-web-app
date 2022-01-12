<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
export default {
  data: function() {
    return {
    };
  },
  beforeCreate() {
    const existingSession = this.$cookie.get('session');

    if (existingSession && existingSession.length && JSON.parse(existingSession) != null) {
      const session = JSON.parse(existingSession);
      // console.log(`current session: ${existingSession}`);
      // console.log(`expires: ${new Date(1000 * parseFloat(session['tokens']['expiry']))}`);
      this.$store.commit('user', session.user);
      this.$store.commit('auth', session.tokens);
      this.$router.push({ name: 'dashboard' }).catch(handleError);
    } else {
      this.$router.push({ name: 'login' }).catch(handleError);
    }

    function handleError(err) {
      if (
        err.name !== 'NavigationDuplicated' &&
          !err.message.includes('Avoided redundant navigation to current location')
      ) {
        console.error(err);
      }
    }
  },
};
</script>

<style>
  body {
    margin: 0;
    overflow: hidden;
  }
</style>
