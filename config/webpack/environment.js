const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)

const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')
const eslint =  require('./loaders/eslint')

environment.loaders.append('vue', vue)

environment.loaders.append('eslint', eslint)

module.exports = environment
