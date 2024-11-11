class AdminController < ApplicationController
  class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin

    def dashboard
      # C'est ici que l'administrateur peut choisir entre créer un article ou un tag
    end

    private

    def check_admin
      unless current_user.admin?
        redirect_to root_path, alert: "Vous n'avez pas l'autorisation d'accéder à cette page."
      end
    end
  end

end
