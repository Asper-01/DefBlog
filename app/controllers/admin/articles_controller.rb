module Admin
  class ArticlesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_article, only: [:edit, :update, :destroy]

    def index
      @articles = Article.includes(:tags).page(params[:page]).per(5)
    end

    def show
      @article = Article.includes(:tags).find(params[:id])
    end

    def new
      @article = Article.new
      @articles = Article.all
    end

    # Crée un nouvel article avec les paramètres transmis
    def create
      @article = Article.new(article_params)
      @article.author = current_user
      if @article.save
        redirect_to admin_articles_path, notice: 'Article créé avec succès.'
      else
        render :new
      end
    end

    # Récupère l'article à modifier
    def edit
      # L'article est déjà chargé par le before_action `set_article`
    end

    # Met à jour l'article
    def update
      # Ajout : Gestion de la suppression de l'image
      if params[:article][:remove_image] == "1" && @article.image.attached?
        @article.image.purge # Supprime l'image actuelle si la case est cochée
      end

      # Mettre à jour l'article
      if @article.update(article_params)
        redirect_to admin_articles_path, notice: 'Article mis à jour avec succès.'
      else
        render :edit
      end
    end

    # Supprime un article
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to admin_articles_path, notice: 'Article supprimé avec succès.'
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_articles_path, alert: 'Article introuvable.'
    end

    private

    # Définit les paramètres autorisés pour l'article
    def article_params
      params.require(:article).permit(:title, :content, :image, :remove_image, tag_ids: []) # Inclut l'image et le parametre remove
    end

    # Recherche l'article par ID, utilisé dans les actions :edit, :update, :destroy
    def set_article
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_articles_path, alert: "Article introuvable."
    end
  end
end
