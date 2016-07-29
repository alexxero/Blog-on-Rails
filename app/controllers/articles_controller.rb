class ArticlesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :check_auth, :only => [:edit, :update, :destroy]


  def new
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user.username

    if @article.valid?
      @article.save
      redirect_to @article
    else
      render action: 'new'
    end

  end

  def show
    @comments = Comment.all
    @post_comments = Comment.where(article_id: 1)

    @comm_auth = Comment.find_or_create_by(author: @article.author)
    @commenter_avatar = User.find_or_create_by(username: @comm_auth.author)
    # username of article author (using for extracting author's avatar)
    @user = User.find_or_create_by(username: @article.author)
  end

  def index
    @articles = Article.order(id: :desc)
    # @article = Article.find(params[:id])
    # @user = User.find_or_create_by(username: @article.author)
  end

  def edit

  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def upvote
    @article.upvote_from current_user
    redirect_to article_path(@article)
  end

  def downvote
    @article.downvote_from current_user
    redirect_to article_path(@article)
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def check_auth
    if current_user.username != @article.author
      flash[:notice] = 'Sorry, you can\'t edit this post'
      redirect_to root_path
    end
  end

end
