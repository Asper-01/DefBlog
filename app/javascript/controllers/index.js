// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { registerControllers } from "stimulus"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)
import TogglePasswordController from "./toggle_password_controller"

application.register("toggle-password", TogglePasswordController)
