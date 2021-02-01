import Vue from 'vue'
import Vuex from 'vuex'

// Vuex requires Promise (opens new window). If your supporting browsers do not implement Promise (e.g. IE),
// you can use a polyfill library, such as es6-promise (opens new window).
// https://vuex.vuejs.org/installation.html#yarn
Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user: null,
    auth: {}
  },
  getters: {
    user: state => state.user,
    auth: state => state.auth
  },
  mutations: {
    user (state, value) {
      state.user = value
    },
    auth (state, value) {
      state.auth = value
    }
  }
})
