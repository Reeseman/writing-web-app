<template>
  <div class="max-w-sm m-auto my-8">
    <div class="border p-10 border-grey-light shadow rounded">
      <h3 class="text-2xl mb-6 text-grey-darkest">Sign In</h3>
      <form @submit.prevent="signin">
        <div class="text-red" v-if="error">{{ error }}</div>

        <div class="mb-6">
          <label for="email" class="label">E-mail Address</label>
          <input type="email" v-model="email" class="input" id="email" placeholder="andy@web-crunch.com">
        </div>
        <div class="mb-6">
          <label for="password" class="label">Password</label>
          <input type="password" v-model="password" class="input" id="password" placeholder="Password">
        </div>
        <button type="submit" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center">Sign In</button>

        <div class="my-4"><router-link to="/signup" class="link-grey">Sign up</router-link></div>
      </form>
    </div>
  </div>
</template>

<script>

import { pick } from 'lodash'

export default {
  name: 'login',
  data () {
    return {
      email: '',
      password: '',
      error: ''
    }
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
}
</script>
