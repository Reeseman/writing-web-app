<template>
  <div>User email: {{ this.email }}</div>
</template>

<script>
  import axios from 'axios'

  export default {
    name: 'User',
    data: function() {
      return {
        email: ''
      }
    },
    methods: {

    },
    created() {
      axios
        .get("http://localhost:3000/api/v1/first_user_email")
        .then(response => {
           console.log(response.data);
           this.email = response.data;
         })
        .catch(e => {
           console.log(e);
        });
    }
  }

</script>

<style scoped>

div {
  font-size: 30px;
}
</style>
