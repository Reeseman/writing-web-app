<template>
  <div class="sidenav">
    <div class="mainCtas">
      <h2 class="logo">Collabowrite</h2>
      <div class="email">
        {{ JSON.parse(this.$cookie.get('session')).user.email }}
      </div>
      <div class="ctaContainer" v-on:click="updateTab('My Writs')" v-bind:class="{ active: tab == 'My Writs' }">
        <icon-base icon-name="papers" :icon-color="iconColor">
          <icon-papers />
        </icon-base>
        <div>My Writs</div>
      </div>
      <div class="ctaContainer" v-on:click="updateTab('New Game')" v-bind:class="{ active: tab == 'New Game' }">
        <icon-base icon-name="write" :icon-color="iconColor">
          <icon-write />
        </icon-base>
        <div>New Game</div>
      </div>
      <div class="ctaContainer" v-on:click="updateTab('Contacts')" v-bind:class="{ active: tab == 'Contacts' }">
        <icon-base icon-name="people" :icon-color="iconColor">
          <icon-people />
        </icon-base>
        <div>Contacts</div>
      </div>
<!--       <div class="ctaContainer" v-on:click="updateTab('Settings')" v-bind:class="{ active: tab == 'Settings' }">
        <icon-base icon-name="gear" :icon-color="iconColor">
          <icon-gear />
        </icon-base>
        <div>Settings</div>
      </div>
 -->    </div>
    <div class="footerCtas">
      <div class="ctaContainer" v-on:click.prevent="logout">
        <icon-base icon-name="logout" :icon-color="iconColor">
          <icon-logout />
        </icon-base>
        <div>Logout</div>
      </div>
    </div>
  </div>
</template>

<script>
  import IconBase from 'components/icons/IconBase'
  import IconGear from 'components/icons/IconGear'
  import IconLogout from 'components/icons/IconLogout'
  import IconPapers from 'components/icons/IconPapers'
  import IconPeople from 'components/icons/IconPeople'
  import IconWrite from 'components/icons/IconWrite'
  import colors from 'application.scss'

  export default {
    name: 'BaseSidenav',
    props: {
      tab: {
        type: String,
        required: true
      },
    },
    data: function() {
      return {
        iconColor: colors.offWhite,
      };
    },
    components: {
      IconBase,
      IconGear,
      IconLogout,
      IconPapers,
      IconPeople,
      IconWrite,
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
      },
      updateTab(tabName) {
        this.$emit('eventname', tabName);
      }
    },
  };
</script>

<style lang="scss" scoped>
  @import 'application.scss';

  .sidenav {
    height: 100%; /* Full-height: remove this if you want "auto" height */
    width: 160px; /* Set the width of the sidebar */
    position: fixed; /* Fixed Sidebar (stay in place on scroll) */
    z-index: 1; /* Stay on top */
    top: 0; /* Stay at the top */
    left: 0;
    overflow-x: hidden; /* Disable horizontal scroll */
    padding-top: 5px;
    background-color: $darkBlue;
    margin: 0;
    overflow-y: hidden;
    .mainCtas {
      min-height: calc(100vh - 4rem);
      .email {
        color: $offWhite;
        margin-left: 17px;
        padding-bottom: 16px;
        margin-bottom: 10px;
      }
    }
    .footerCtas {
      height: 4rem;
    }
  }

  .ctaContainer {
    padding-top: 8px;
    padding-bottom: 8px;
    padding-left: 12px;
    width: 100%;
  }

  .ctaContainer > div {
    padding-left: 5px;
    text-decoration: none;
    font-size: 18px;
    color: $offWhite;
    display: inline-block;
  }

  .active {
    background-color: $darkestBlue;
  }

  .ctaContainer:hover {
    background-color: $darkestBlue;
    cursor: pointer;
  }

  .ctaContainer:hover > div {
    text-decoration: underline;
  }

  .logo {
    padding: 6px 8px 0 16px;
    margin-bottom: 0;
    text-decoration: none;
    font-size: 22px;
    display: block;
    color: $offWhite
  }

  /* On smaller screens, where height is less than 450px, change the style of the sidebar (less padding and a smaller font size) */
  @media screen and (max-height: 450px) {
    .sidenav { 
      padding-top: 15px;
    }
    .sidenav a {
      font-size: 15px;
    }
  }
</style>
