/* global Vue, VueRouter, axios */
var ProductEditPage = {
  template: "#product-edit-page",
  data: function() {
    return {
      name: "",
      description: "",
      price: "",
      stocked: "",
      supplier: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        input_name: this.name,
        input_description: this.description,
        input_price: this.price,
        input_stocked: this.stocked,
        input_supplier_id: this.input_supplier_id
      };
      axios
        .patch("/api/products/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/");
        }).catch(function(error) {
          this.errors = error.response.data.errors;
        }.bind(this));
    }
  },
  created: function() {
    console.log('in created function for edit page');
    console.log(this.$route.params.id); //prints out id

    axios.get("/api/products/" + this.$route.params.id).then(function(response) {
      console.log(response);
      // this.product = response.data; ---> can't use this because multiple variables define above instead of an object
      this.name = response.data.name;
      this.description = response.data.description;
      this.price = response.data.price;
      this.stocked = response.data.stocked;
      this.supplier = response.data.supplier;

    }.bind(this));
  }
};

var ProductShowPage = {
  template: "#show-page",
  data: function() {
    return {
      message: "In the show page!",
      product: {name: "", description: "", price: "", formatted: {tax: "", total: ""}, stocked: ""} 
    };
  },
  created: function() {
    console.log('in created function for show page');
    console.log(this.$route.params.id);

    axios.get("/api/products/" + this.$route.params.id).then(function(response) {
      console.log(response.data);
      this.product = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var OrdersPage = {
  template: "#orders-page",
  data: function() {
    return {
      orders: []
    };  
  },
  created: function() {
    console.log('in created function for orders page');

    axios.get('/api/orders').then(function(response) {
      console.log(response.data);
      this.products = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var ShoppingCartPage = {
  template: "#shopping-cart-page",
  data: function() {
    return {
      products: []
    };
  },
  created: function() {
    console.log('in created function');

    axios.get('/api/carted_products').then(function(response) {
      console.log(response.data);
      this.products = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var NewProductPage = {
  template: "#new-product-page",
  data: function() {
    return {
      name: "",
      description: "",
      price: "",
      stocked: "",
      supplier: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        input_name: this.name,
        input_description: this.description,
        input_price: this.price,
        input_stocked: this.stocked,
        input_supplier_id: this.input_supplier_id
      };
      axios
        .post("/api/products", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: [],
      sortAttribute: "",
      sortOrder: 1
    };
  },
  created: function() {
    console.log('in created function');

    axios.get('/api/products').then(function(response) {
      console.log(response.data);
      this.products = response.data;
    }.bind(this));
  },
  methods: {
    setSortAttribute: function(attribute) {
      this.sortAttribute = attribute;
    },
    toggleSortOrder: function() {
      console.log('toggleling sort order');
      this.sortOrder = this.sortOrder * -1;
    }
  },
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/shopping_cart", component: ShoppingCartPage },
    { path: "/orders", component: OrdersPage },
    { path: "/products/new", component: NewProductPage },
    { path: "/products/:id", component: ProductShowPage },
    { path: "/products/:id/edit", component: ProductEditPage }

  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});