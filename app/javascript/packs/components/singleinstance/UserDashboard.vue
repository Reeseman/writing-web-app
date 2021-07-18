<template>
  <div id="UserDashboard.vue">
    <BaseSidenav :tab="tab"/>
    <div class="main">
      <div>user logged in homepage</div>
      <div>{{ this.email }}</div>
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
        tab: '',
      };
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

<style lang="scss" scoped>
  @import 'application.scss';

  .main {
    margin-left: 160px;
    padding: 20px;
    background-color: $offWhite;
    width: 100%;
    height: 100vh;
  }
</style>
