import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "display"]

  connect() {}

  edit(event) {
    event.preventDefault()
    this.formTarget.classList.remove("d-none")
    this.displayTarget.classList.add("d-none")
  }

  cancel(event) {
    event.preventDefault()
    this.formTarget.classList.add("d-none")
    this.displayTarget.classList.remove("d-none")
  }

  submit(event) {
    event.preventDefault();

    console.log(this.formTarget);  // Ajoute ceci pour voir ce que contient formTarget

    if (this.formTarget && this.formTarget instanceof HTMLFormElement) {
        const formData = new FormData(this.formTarget);

        fetch(this.formTarget.action, {
            method: "PATCH",
            headers: { "X-Requested-With": "XMLHttpRequest" },
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            this.displayTarget.innerText = data.name;
            this.formTarget.classList.add("d-none");
            this.displayTarget.classList.remove("d-none");
        })
        .catch(error => console.error("Erreur:", error));
    } else {
        console.error("Le formulaire n'est pas valide ou introuvable.");
    }
}


}
