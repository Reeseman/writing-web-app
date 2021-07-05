<template>
  <div class="sidenav">
    <h2 class="logo">Collabowrite</h2>
    <div class="ctaContainer">
      <icon-base icon-name="write" :icon-color="iconColor">
        <icon-write />
      </icon-base>
      <a href="#">New Game</a>
    </div>
    <div class="ctaContainer">
      <icon-base icon-name="papers" :icon-color="iconColor">
        <icon-papers />
      </icon-base>
      <a href="#">My Writs</a>
    </div>
    <div class="ctaContainer">
      <icon-base icon-name="people" :icon-color="iconColor">
        <icon-people />
      </icon-base>
      <a href="#">Contacts</a>
    </div>
    <div class="ctaContainer">
      <icon-base icon-name="gear" :icon-color="iconColor">
        <icon-gear />
      </icon-base>
      <a href="#">Settings</a>
    </div>
    <div class="ctaContainer">
      <icon-base icon-name="logout" :icon-color="iconColor">
        <icon-logout />
      </icon-base>
      <a href="#" v-on:click.prevent="logout">Logout</a>
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
    padding-left: 16px;
    background-color: $darkBlue;
  }

  .sidenav a {
    padding: 0px 8px 6px 5px;
    text-decoration: none;
    font-size: 18px;
    color: $offWhite
  }

  .ctaContainer {
    margin-top: 15px;
  }

  .logo {
    padding: 6px 8px 16px 0;
    text-decoration: none;
    font-size: 22px;
    display: block;
    color: $offWhite
  }

  /* When you mouse over the navigation links, change their color */
  .sidenav a:hover {
  }

  .main {
    margin-left: 160px; /* Same as the width of the sidebar */
    padding: 0px 10px;
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
