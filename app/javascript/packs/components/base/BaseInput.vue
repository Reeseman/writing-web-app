<template>
  <div class="inputContainer">
    <label for="email" v-if="type === 'Email'">Email Address</label>
    <input type="email" v-model="email" id="email" placeholder="Email" v-if="type === 'Email'"/>
    <label for="password" v-if="type === 'Password'">Password</label>
    <input type="password" v-model="password" id="password" placeholder="Password" v-if="type === 'Password'">
  </div>
</template>

<script>
   export default {
      name: 'BaseInput',
      data () {
        return {
          email: '',
          password: '',
          error: ''
        }
      },
      props: {
        type: String,
      }
   };
</script>

<style lang="scss" scoped>
   @import 'application.scss';
</style>
