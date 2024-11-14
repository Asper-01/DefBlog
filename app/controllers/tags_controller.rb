class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
    @tags = Tag.order(:id) # Tri par ID
  end

  # Action d'édition
  def edit
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  # Action de mise à jour
  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to new_tag_path, notice: 'Le tag a été mis à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Action suppresion
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_path, notice: "Tag supprimé avec succès." }
      format.turbo_stream
    end
  end


  private

  def set_tag
    @tag = Tag.find(params[:id])  # Vérifie que params[:id] correspond bien à un ID valide
  rescue ActiveRecord::RecordNotFound
    redirect_to tags_path, alert: "Tag non trouvé"
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
