import { Controller } from 'stimulus';
export default class AnimalFilterController extends Controller {
  static targets = ['animalList', 'animal'];
  filter(event) {
    const category = event.target.getAttribute('data-category');
    this.animalListTargets.forEach(animalList => {
      this.animalTargets.forEach(animal => {
        if (category === 'all' || animal.getAttribute('data-category') === category) {
          animal.style.display = 'block';
        } else {
          animal.style.display = 'none';
        }
      });
    });
  }
}
