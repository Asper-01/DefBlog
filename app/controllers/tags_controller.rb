class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: [:edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to @tag, notice: "Tag mis à jour."
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path, notice: "Tag supprimé."
  end

  private

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Vous n'êtes pas autorisé à accéder à cette action."
    end
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
