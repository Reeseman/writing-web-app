import Vue from 'vue'
import Router from 'vue-router'
import login from './components/sessions/login'
import signup from './components/sessions/signup'
import forgot_password from './components/sessions/forgot_password'
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
      path: '/users/signup',
      name: 'signup',
      component: signup
    },
    {
      path: '/users/forgot_password',
      name: 'forgot_password',
      component: forgot_password
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: dashboard
    },
  ]
})
