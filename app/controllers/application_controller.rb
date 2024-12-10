class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception, unless: -> { devise_controller? || request.path.start_with?('/users/auth') }

  def check_admin
    redirect_to root_path, alert: "Vous n'avez pas la permission de supprimer des tags." unless current_user.admin?
  end
end
