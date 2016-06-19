class CommentsController < ApplicationController

  before_filter :authenticate_user!, :only => [:create]

  def create
    @article = Article.find(params[:article_id])
    new_comment = @article.comments.new(comment_params)
    new_comment.author = current_user.username
    new_comment.save

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end
