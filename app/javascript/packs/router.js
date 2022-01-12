import Vue from 'vue';
import Router from 'vue-router';
import SignIn from './components/singleinstance/sessions/SignIn';
import SignUp from './components/singleinstance/sessions/SignUp';
import ForgotPassword from './components/singleinstance/sessions/ForgotPassword';
import UserDashboard from './components/singleinstance/UserDashboard';

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/users/login',
      name: 'login',
      component: SignIn
    },
    {
      path: '/users/signup',
      name: 'signup',
      component: SignUp
    },
    {
      path: '/users/forgot_password',
      name: 'forgot_password',
      component: ForgotPassword
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: UserDashboard
    },
  ]
});
