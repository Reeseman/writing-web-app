import Vue from 'vue'
import vueCookie from 'vue-cookie'
import status from 'http-status'
import axios from 'axios'
import { pick } from 'lodash'

import router from './router'
import store from './store'

import App from '../app.vue'

Vue.config.productionTip = false

// Put your instance of Axios in `Vue.prototype` which gives you easy global access to it.
// You can pass in configuration that is shared application-wide.
Vue.prototype.$http = axios.create()
Vue.prototype.$cookie = vueCookie

// This first fat arrow function defines a callback invoked after any SUCCESSFUL request.
// This is where we check if the backend included an `access-token` header.
Vue.prototype.$http.interceptors.response.use((response) => {
  if (response.headers['access-token']) {
    // Commits the relevant headers to the store, calling mutation `auth`.
    const authHeaders = pick(response.headers, ["access-token","client","expiry","uid","token-type"])
    store.commit('auth', authHeaders)

    var session = vueCookie.get('session')

    // Stores the tokens in a cookie called `session` too. Cookie values are strings, so have to
    // serialize it to JSON.
    //
    // The object we are storing in session looks like this:
    // {'tokens': {'access-token': 'foo', ...}, 'user': {'email': 'foo@bar.com', ...}}
    // so that is why we are extracting and modifying, so that the `user` key isn't blown away.
    if (session && JSON.parse(session)) {
      var session = JSON.parse(session)
      session['tokens'] = authHeaders

      vueCookie.set('session', JSON.stringify(session), { expires: '14D' })
    }
  }

  return response
}, (error) => {
  // This second fat arrow function defines a callback invoked after any FAILED request.
  // This handles every case when the server responds with a 403 / unauthorized. That means
  // we need to redirect the user to the SignIn component.
  if (router.currentRoute.name !== 'login' && error.response.status === status.UNAUTHORIZED) {
    store.commit('user', null)
    router.push({ name: 'login' })
  }

  return Promise.reject(error)
})

Vue.prototype.$http.interceptors.request.use((config) => {
  const headers = store.getters['auth']

  // object that holds configuration of the request that's about to be made
  config.headers = headers
  // console.log(headers);
  return config
})

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    store,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})
