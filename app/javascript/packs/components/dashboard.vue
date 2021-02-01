<template>
  <div>
    <p>user logged in homepage</p>
    <form @submit.prevent="logout">
      <button type="submit">Logout</button>
    </form>
  </div>
</template>

<script>

export default {
  name: 'dashboard',
  data: function() {
    return {
    };
  },
  methods: {
    logout() {
      this.$http.delete('/auth/sign_out', { })
        .then(response => {
          this.$cookie.set('session', null);
          this.$store.commit('auth', null)
          this.$store.commit('user', null)

          this.$router.push({ name: 'login' })
        })
        .catch(error => console.log(error))
    }
  }
};

</script>

<style scoped>
</style>
