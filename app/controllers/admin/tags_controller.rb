module Admin
class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
    @tag = Tag.new # Initialise un tag vierge
  end

  def new
    @tag = Tag.new
    @tags = Tag.order(:id) # Tri par ID
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path, notice: "Tag créé avec succès."
    else
      @tags = Tag.all # Nécessaire pour réafficher les tags sur la page
      render :index, status: :unprocessable_entity
    end
  end

  # Action d'édition
  def edit
    @tag = Tag.find(params[:id])
  end


  # Action de mise à jour
  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to admin_tags_path, notice: 'Le tag a été mis à jour avec succès.'
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
end
