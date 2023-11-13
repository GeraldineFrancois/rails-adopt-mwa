// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import "@rails/actioncable"

document.addEventListener("DOMContentLoaded", function() {
  document.getElementById("btnradio1").addEventListener("click", function() {
    showAllAnimalCards();
  });
  document.getElementById("btnradio2").addEventListener("click", function() {
    showFilteredAnimalCards("dog");
  });
  document.getElementById("btnradio3").addEventListener("click", function() {
    showFilteredAnimalCards("cat");
  });
});
function showAllAnimalCards() {
  const animalCards = document.querySelectorAll(".card");
  console.log("hello")
  animalCards.forEach(function(card) {
    card.style.display = "block";

  });
}
function showFilteredAnimalCards(breed) {
  const animalCards = document.querySelectorAll(".card");
  console.log("hello");
  animalCards.forEach(function(card) {
    // Check the content of the card or carousel to determine the type
    if (card.classList.contains(breed)) {
      card.style.display = "block";
    } else {
      card.style.display = "none";
    }
  });
}
