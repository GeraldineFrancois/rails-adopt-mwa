import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delay"
export default class extends Controller {
  static targets= ["flash"]

  connect() {
    setTimeout(() => {
      this.flashTarget.classList.add("alert-fade")
    }, 3000);
  }
}
