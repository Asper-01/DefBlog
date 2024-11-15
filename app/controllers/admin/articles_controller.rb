# app/controllers/admin/articles_controller.rb
module Admin
  class ArticlesController < ApplicationController
    before_action :authenticate_user!  # Si tu utilises Devise

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

    private

    def article_params
      params.require(:article).permit(:title, :content)  # adapte selon tes attributs d'article
    end
  end
end
