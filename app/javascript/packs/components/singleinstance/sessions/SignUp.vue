<template>
  <div id="SignUp.vue" class="container">
    <div class="signupContainer">
      <base-title text="Sign Up" />
      <form>
        <div v-if="errorMsg">{{ errorMsg }}</div>

        <div class="inputContainer">
          <label for="email">E-mail Address</label>
          <input type="email" v-model="email" id="email" placeholder="Email">
        </div>
        <div class="inputContainer">
          <label for="password">Password</label>
          <input type="password" v-model="password" id="password" placeholder="Password">
        </div>
        <div class="inputContainer">
          <label for="passwordConfirmation">Password Confirmation</label>
          <input type="password" v-model="passwordConfirmation" id="passwordConfirmation" placeholder="Password Confirmation">
        </div>
        <BaseButton cta="Register" :onClick="signup"/>

        <div class="redirectLinks">
          <span>Already have an account? </span>
          <router-link to="/users/login">Log in</router-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
  import BaseButton from 'components/base/BaseButton';
  import BaseTitle from 'components/base/BaseTitle';
  import { pick } from 'lodash';

  export default {
    name: 'SignUp',
    data () {
      return {
        email: '',
        password: '',
        passwordConfirmation: '',
        errorMsg: ''
      }
    },
    components: {
      BaseButton,
      BaseTitle,
    },
    methods: {
      signup() {
        if (this.isValidFormSubmit()) {
          this.$http.post('/auth', { email: this.email, password: this.password, confirm_success_url: '/' })
            .then(this.handleResponse)
            .catch(this.handleError)
        }
      },
      handleResponse(response) {
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
      },
      handleError(error) {
        this.errorMsg = error
        console.log(error)
      },
      isValidFormSubmit() {
        this.errorMsg = ''
        if (this.password !== this.passwordConfirmation) {
          this.errorMsg = 'Passwords must match'
        } else if (this.password.length < 8) {
          this.errorMsg = 'Password must be at least 8 characters long'
        }
        return this.errorMsg === '';
      }
    }
  };
</script>

<style lang="scss" scoped>
  @import 'application.scss';

  .container {
    background-color: $medBlue;
    overflow: hidden;
    position: absolute;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center; /*centers items on the line (the x-axis by default)*/
    align-items: center; /*centers items on the cross-axis (y by default)*/
  }

  .signupContainer {
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
    font-size: 11px;
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

  .redirectLinks {
    margin-top: 30px;
    width: 100%;
  }

  .redirectLinks a {
    color: $darkBlue;
  }
</style>
