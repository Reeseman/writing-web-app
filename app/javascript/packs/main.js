import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import App from '../app.vue'

Vue.use(Vuetify)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    vuetify: new Vuetify(),
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})

// figure this out later, it currently causes some console error...
// import TurbolinksAdapter from 'vue-turbolinks'

// Vue.use(TurbolinksAdapter)

// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
