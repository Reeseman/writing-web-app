<template>
  <div id="SignIn.vue" class="container">
    <h1 class="title">Writwell</h1>
    <h3 class="subtitle">Sign in to collaborate with writers around the world</h3>
    <form @submit.prevent="signin">
      <div v-if="error">{{ error }}</div>

      <div class="inputContainer">
        <label for="email">E-mail Address</label>
        <input type="email" v-model="email" id="email" placeholder="Email">
      </div>

      <div class="inputContainer">
        <label for="password">Password</label>
        <input type="password" v-model="password" id="password" placeholder="Password">
      </div>
      <BaseButton cta="Sign In"/>
    </form>
    <table class="redirectLinks">
      <tbody>
      <tr>
        <td style="text-align: left; align: right;">
          <router-link to="/users/signup">Sign up</router-link>
        </td>
        <td style="text-align: right; align: right;">
          <router-link to="/users/forgot_password">Forgot password?</router-link>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
  import BaseButton from 'components/base/BaseButton'
  import { pick } from 'lodash';

  export default {
    name: 'SignIn',
    data () {
      return {
        email: '',
        password: '',
        error: ''
      }
    },
    components: {
      BaseButton,
    },
    methods: {
      signin() {
        this.$http.post('/auth/sign_in', { email: this.email, password: this.password, confirm_success_url: '/' })
          .then(response => {
            // Again commits the relevant headers to the store.
            const authHeaders = pick(response.headers,
                                     ["access-token","client","expiry","uid","token-type"])
            this.$store.commit('auth', authHeaders)

            // response.data.data is an object containing public information about the current user.
            // This is useful to keep track of so that your app can display the current user's
            // email/username somewhere.
            this.$store.commit('user', response.data.data)

            // Write both the response headers and the current user data to the cookie.
            const contents = {
              tokens: authHeaders,
              user: response.data.data
            }

            this.$cookie.set('session',
                             JSON.stringify(contents),
                             { expires: '14D' })

            // Go home or wherever the user originally wanted to go
            this.$router.push({ name: 'dashboard' })
          })
          .catch(error => console.log(error))
      },
    }
  };
</script>

<style lang="scss">
  @import 'application.scss';

  body {
    background-color: $medBlue;
    overflow: hidden;
    position: absolute;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center; /*centers items on the line (the x-axis by default)*/
    align-items: center; /*centers items on the cross-axis (y by default)*/
  }

  .container {
    max-width: 600px;
    min-width: 325px;
    text-align: center;
    border: 2px solid $darkOrange;
    background-color: $whiteSpace;
    border-radius: 23px;
    padding: 10px;
  }

  .inputContainer {
    margin-bottom: 10px;
    text-align: left;
    width: 100%;
  }

  .inputContainer label {
    font-size: 10px;
    display: block;
    font-family: sans-serif;
    margin-bottom: 2px;
    margin-left: 2px;
  }

  .inputContainer input {
    padding: 10px;
    display: block;
    width: 100%;
    box-sizing: border-box;
    -webkit-box-sizing:border-box;
    -moz-box-sizing: border-box;
    border-radius: 3px;
    border: 1px solid $darkBlue;
    outline: none;
  }

  .inputContainer input:focus {
    outline: none;
    border: 1px solid $darkOrange;
  }

  .redirectLinks {
    margin-top: 30px;
    width: 100%;
  }

  .redirectLinks a {
    color: $darkBlue;
  }

  .title {
    padding-top: 0;
    padding-bottom: 0;
    margin-bottom: 0;
    color: $darkBlue;
    font-family: serif;
    font-weight: normal;
  }

  .subtitle {
    padding-top: 0;
    margin-top: 0;
    font-size: 15px;
    color: $darkBlue;
    font-family: serif;
    font-weight: normal;
  }
</style>
