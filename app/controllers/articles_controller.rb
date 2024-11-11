class ArticlesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc)  # Trie les articles par date de création, du plus récent au plus vieux
  end
  before_action :authenticate_user!
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: %i[show edit update destroy]

  # Affiche le formulaire pour créer un nouvel article
  def new
    @article = Article.new
  end

  # Crée un nouvel article à partir des paramètres soumis dans le formulaire
  def create
    @article = Article.new(article_params)
    @article.author_id = current_user.id  # Assigner l'auteur comme étant l'utilisateur actuellement connecté

    if @article.save
      redirect_to @article, notice: 'Article créé avec succès.'
    else
      render :new
    end
  end

  # Affiche un article spécifique
  def show
    @article = Article.find(params[:id])
  end

  # Affiche le formulaire pour modifier un article existant
  def edit
  end

  # Met à jour un article existant avec les nouveaux paramètres
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article mis à jour avec succès.'
    else
      render :edit
    end
  end

  # Supprime un article
  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Article supprimé avec succès.'
  end

  private
  # Méthode pour récupérer et autoriser les paramètres nécessaires à la création ou mise à jour de l'article
  def article_params
    params.require(:article).permit(:title, :content, :image)
  end
  # Méthode pour trouver l'article basé sur l'ID
  def set_article
    @article = Article.find(params[:id])
  end

  # Vérifie si l'utilisateur est un administrateur avant d'accéder à certaines actions
  def require_admin
    redirect_to root_path, alert: "Accès réservé aux administrateurs." unless current_user.admin?
  end
end
