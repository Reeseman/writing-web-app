import Vue from 'vue'
import Router from 'vue-router'
import login from './components/sessions/login'
import dashboard from './components/dashboard'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/users/login',
      name: 'login',
      component: login
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: dashboard
    },
  ]
})
