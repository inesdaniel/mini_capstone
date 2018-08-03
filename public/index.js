/* global axios */
console.log('files linked');

var productTemplate = document.querySelector('#product-card');
var productContainer = document.querySelector('.row');

// productContainer.appendChild(productTemplate.content.cloneNode(true));
// productContainer.appendChild(productTemplate.content.cloneNode(true));

axios.get("/api/products").then(function(response) {
  console.log(response);
  var products = response.data;

  products.forEach(function(product) {
    var productClone = productTemplate.content.cloneNode(true);

    productClone.querySelector('.card-title').innerText = product.name;
    productClone.querySelector('.card-text').innerText = product.description;
    productClone.querySelector('.id').innerText = "Id:" + product.id;
    productClone.querySelector('.price').innerText = "Price:" + product.price;
    productClone.querySelector('.tax').innerText = "Tax:" + product.formatted.tax;
    productClone.querySelector('.total').innerText = "Total:" + product.formatted.total;

    productContainer.appendChild(productClone);
  });
});
