class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to article_path(@article), notice: 'Commentaire ajouté avec succès.'
    else
      redirect_to article_path(@article), alert: 'Erreur : impossible d’ajouter le commentaire.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
