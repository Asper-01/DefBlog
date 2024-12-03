class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to article_path(@article), notice: 'Commentaire ajouté avec succès.'
    else
      Rails.logger.debug "Comment params: #{params[:comment].inspect}"
      Rails.logger.debug "Erreur lors de la sauvegarde du commentaire : #{@comment.errors.full_messages}"
    redirect_to @article, alert: 'Impossible d’ajouter le commentaire.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
