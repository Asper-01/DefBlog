import { Turbo } from "@hotwired/turbo-rails"
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import ToggleReplyController from "./controllers/toggle_reply_controller";
import { registerControllers } from "controllers"  // Point d'entrée contrôleurs Stimulus
import Rails from "@rails/ujs"
Rails.start()

// Initialiser Turbo
Turbo.start()

// Initialiser Stimulus
const application = Application.start()
const context = require.context("controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
window.Stimulus = Application.start();


// Enregistre le contrôleur
Stimulus.register("toggle-reply", ToggleReplyController);
