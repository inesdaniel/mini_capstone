/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: []
    };
  },
  created: function() {
    console.log('in created function');

    axios.get('/api/products').then(function(response) {
      console.log(response.data);
      this.products = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [{ path: "/", component: HomePage }],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});