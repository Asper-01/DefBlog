class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def check_admin
    redirect_to root_path, alert: "Vous n'avez pas la permission de supprimer des tags." unless current_user.admin?
  end
end
