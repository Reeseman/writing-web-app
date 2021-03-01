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
      console.log(`current session: ${existingSession}`);
      this.$store.commit('user', session.user)
      this.$store.commit('auth', session.tokens)
      this.$router.push({ name: 'dashboard' }).catch(thing);
    } else {
      this.$router.push({ name: 'login' }).catch(thing);
    }

    function thing(err) {
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

<!-- https://www.colorpoint.io/color-palette/goldfish/ -->
<style>
  body {
    padding: 30px 30px 30px 30px;
    background-color: #E0E4CC;
  }
  .primary {
    color: #69D2E7;
  }
  .primary-bg {
    background-color: #69D2E7;
  }
  .secondary {
    color: #FA6900;
  }
  .secondary-bg {
    background-color: #FA6900;
  }
  .light {
    color: #E0E4CC;
  }
  .light-bg {
    background-color: #E0E4CC;
  }
</style>
