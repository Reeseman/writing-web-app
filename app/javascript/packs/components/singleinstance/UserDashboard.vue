<template>
  <div id="UserDashboard.vue" class="dashboard">
    <base-sidenav @eventname="updateTab" :tab="tab" />
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
        tab: JSON.parse(this.$cookie.get('session')).tab || 'My Writs',
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
        var session = JSON.parse(this.$cookie.get('session'));
        session.tab = tabName;
        this.$cookie.set('session', JSON.stringify(session));
      }
    },
    beforeCreate() {
      this.$http.get(`/user_data?uid=${JSON.parse(this.$cookie.get('session'))['user']['id']}`, { })

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

  body {
    background-color: $offWhite;
  }

  .dashboard {
    overflow: hidden;
    background-color: $offWhite;

    .main {
      margin-left: 160px;
      background-color: $offWhite;
      width: 100%;
      height: 100vh;
    }
  }
</style>
