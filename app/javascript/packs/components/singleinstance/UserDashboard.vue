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

<style scoped>

/* The sidebar menu */
.sidenav {
  height: 100%; /* Full-height: remove this if you want "auto" height */
  width: 160px; /* Set the width of the sidebar */
  position: fixed; /* Fixed Sidebar (stay in place on scroll) */
  z-index: 1; /* Stay on top */
  top: 0; /* Stay at the top */
  left: 0;
  overflow-x: hidden; /* Disable horizontal scroll */
  padding-top: 20px;
}

.sidenav p {
}

/* The navigation menu links */
.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  display: block;
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover {
}

/* Style page content */
.main {
  margin-left: 160px; /* Same as the width of the sidebar */
  padding: 0px 10px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidebar (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

</style>
