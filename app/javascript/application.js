import { Turbo } from "@hotwired/turbo-rails"
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import { registerControllers } from "controllers"  // Point d'entrée pour tes contrôleurs Stimulus
import Rails from "@rails/ujs"
Rails.start()

// Initialiser Turbo
Turbo.start()

// Initialiser Stimulus
const application = Application.start()
const context = require.context("controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
