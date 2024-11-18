# app/controllers/admin/articles_controller.rb
module Admin
  class ArticlesController < ApplicationController
    before_action :authenticate_user!  # Si tu utilises Devise
    before_action :set_article, only: [:edit, :update, :destroy]

    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to admin_articles_path, notice: 'Article créé avec succès.'
      else
        render :new
      end
    end
    def edit
      @article = Article.find(params[:id]) # Cette ligne doit être présente
    end

    def update
      if @article.update(article_params)
        redirect_to admin_articles_path, notice: 'Article mis à jour avec succès.'
      else
        render :edit
      end
    end
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to admin_articles_path, notice: 'Article supprimé avec succès.'
    end

    private

    def article_params
      params.require(:article).permit(:title, :content)  # adapte selon tes attributs d'article
    end
    def find_article
      @article = Article.find(params[:id]) # Recherche l'article par son ID
    end
    def set_article
      Rails.logger.debug "Params ID: #{params[:id]}"
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_articles_path, alert: "Article introuvable."
    end

  end
end
