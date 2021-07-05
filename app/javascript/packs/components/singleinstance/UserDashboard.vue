<template>
  <div>
    <BaseSidenav />
    <div class="main">
      <p class="text-primary">user logged in homepage</p>
      <p>{{ this.email }}</p>
    </div>
  </div>
</template>

<script>
  import BaseSidenav from '../base/BaseSidenav'

  export default {
    name: 'UserDashboard',
    data: function() {
      return {
        email: JSON.parse(this.$cookie.get('session'))['user']['email'],
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
    },
    components: {
      BaseSidenav
    },
    beforeCreate() {
      // console.log(`beforeCreate session data cookie: ${JSON.parse(this.$cookie.get('session'))}`);
      this.$http.get(`/user_data?token=${this.$cookie.get('session')}`, { })
            
        .then(response => {
          //console.log(`get /user_data response: ${JSON.stringify(response)}`);
        })
        .catch(error => console.log(error))
    },
  };
</script>

<style lang="scss">
  @import 'application.scss';
  body {
    background-color: $offWhite;
  }
</style>
