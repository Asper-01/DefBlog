import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form"];

  connect() {
    console.log("ToggleReplyController connected");
  }

  toggleForm(event) {
    const commentId = event.target.dataset.commentId;
    const form = document.querySelector(`#reply-form-${commentId}`);
    form.classList.toggle("d-none");
  }
}
