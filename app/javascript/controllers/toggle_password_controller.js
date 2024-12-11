import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["password", "buttonText"];

  connect() {
    console.log("tut tut fils de pute ! ")

  }  toggle() {
    const input = this.passwordTarget;
    const isPassword = input.type === "password";

    input.type = isPassword ? "text" : "password";
    this.buttonTextTarget.textContent = isPassword ? "Masquer" : "Afficher";
  }
}
