import Vue from 'vue';

Vue.mixin({
  methods: {
    delay(time) {
      return new Promise(resolve => setTimeout(resolve, time));
    },
  }
});
