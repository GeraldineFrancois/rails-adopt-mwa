import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener("DOMContentLoaded", function() {
  const showDogsButton = document.getElementById("show-dogs");
  const showCatsButton = document.getElementById("show-cats");
  const animalList = document.getElementById("animal-list");
  showDogsButton.addEventListener("click", function() {
    filterAnimals("dog");
  });
  showCatsButton.addEventListener("click", function() {
    filterAnimals("cat");
  });
  function filterAnimals(category) {
    const animals = animalList.querySelectorAll("li");
    animals.forEach(function(animal) {
      const animalCategory = animal.getAttribute("data-category");
      if (category === "all" || animalCategory === category) {
        animal.style.display = "block";
      } else {
        animal.style.display = "none";
      }
    });
  }
});
