<template>
  <div>
    <div>
      <h3>Sign up</h3>
      <form @submit.prevent="signup">
        <div v-if="errorMsg">{{ errorMsg }}</div>

        <div>
          <label for="email">E-mail Address</label>
          <input type="email" v-model="email" id="email" placeholder="andy@web-crunch.com">
        </div>
        <div>
          <label for="password">Password</label>
          <input type="password" v-model="password" id="password" placeholder="Password">
        </div>
        <div>
          <label for="passwordConfirmation">Password Confirmation</label>
          <input type="password" v-model="passwordConfirmation" id="passwordConfirmation" placeholder="Password Confirmation">
        </div>
        <button type="submit">Register</button>

        <div>Already have an account? <router-link to="/users/login">Log in</router-link></div>
      </form>
    </div>
  </div>
</template>

<script>
  import { pick } from 'lodash'

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
  }
</script>


