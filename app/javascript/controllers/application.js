import { Application } from "@hotwired/stimulus"
import ToggleController from "./controllers/toggle_controller";
import Rails from "@rails/ujs";
Rails.start();

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = Application.start();
Stimulus.register("toggle", ToggleController);

export { application }
