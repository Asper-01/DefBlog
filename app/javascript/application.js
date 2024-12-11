import { start } from "@rails/ujs";
import "@hotwired/turbo-rails";
import "controllers";

// Initialisation de Stimulus et des autres bibliothèques
const application = Application.start()

// Enregistrement des contrôleurs
application.register("toggle-password", TogglePasswordController)
