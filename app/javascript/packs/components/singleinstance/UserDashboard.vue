<template>
  <div id="UserDashboard.vue" class="dashboard">
    <base-sidenav @eventname="updateTab" />
    <div class="main">
      <contacts v-show="tab == 'Contacts'" />
      <my-writs v-show="tab == 'My Writs'" />
      <new-game v-show="tab == 'New Game'" />
      <settings v-show="tab == 'Settings'" :user="user" />
    </div>
  </div>
</template>

<script>
  import BaseSidenav from '../base/BaseSidenav'

  import Contacts from '../dashboard/Contacts'
  import MyWrits from '../dashboard/MyWrits'
  import NewGame from '../dashboard/NewGame'
  import Settings from '../dashboard/Settings'

  export default {
    name: 'UserDashboard',
    data: function() {
      return {
        user: {},
        tab: 'My Writs',
      };
    },
    components: {
      BaseSidenav,
      Contacts,
      MyWrits,
      NewGame,
      Settings,
    },
    methods: {
      updateTab(tabName) {
        this.tab = tabName;
      }
    },
    beforeCreate() {
      this.$http.get(`/user_data?token=${this.$cookie.get('session')}`, { })
            
        .then(response => {
          // console.log(`get /user_data response: ${JSON.stringify(response.data)}`);
          this.user = response.data;
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

  .dashboard {
    overflow: hidden;
  }
</style>
