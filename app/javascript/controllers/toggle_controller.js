// app/javascript/controllers/toggle_reply_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form"];

  toggleForm(event) {
    event.preventDefault();
    const commentId = event.currentTarget.dataset.commentId;
    const replyForm = document.getElementById(`reply-form-${commentId}`);

    replyForm.classList.toggle("d-none");
  }
}
