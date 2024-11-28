class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:create, :edit, :update, :destroy]

  def index
    # Initialisation de la requête des categories
    @categories = Category

    # Recherche par titre
    if params[:search].present?
      @categories = @categories.where("title ILIKE ?", "%#{params[:search]}%")
    end

    # Tri par colonne et direction
    sort_column = params[:sort] || "created_at" # Par défaut trié par date
    sort_direction = params[:direction] || "asc" # Par défaut tri croissant

    @categories = @categories.order("#{sort_column} #{sort_direction}").page(params[:page]).per(5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_admin_category_path, notice: "Catégorie créée avec succès."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to edit_admin_categories_path, notice: "Catégorie mise à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @category.tags.clear # Dissocier les tags avant suppression
    @category.destroy
    redirect_to admin_categories_path, notice: "Catégorie supprimée avec succès."
  end


  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
