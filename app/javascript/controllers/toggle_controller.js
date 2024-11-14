import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form"];

  connect() {
    this.hide(); // Cache le formulaire au chargement
  }

  new(event) {
    event.preventDefault();
    this.formTarget.style.display = "block";
  }

  hide(event) {
    if (event) event.preventDefault();
    this.formTarget.style.display = "none";
  }
}
