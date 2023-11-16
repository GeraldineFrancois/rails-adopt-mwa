// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import "@rails/actioncable"


const item = document.querySelector(".fa-heart")
item.addEventListener("click", function(event) {
  item.classList.add("active");
  console.log("bleu");
});
