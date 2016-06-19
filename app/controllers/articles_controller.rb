class ArticlesController < ApplicationController

  before_filter :authenticate_user!
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
    @article = Article.find(params[:id])
    @comments = Comment.all
  end

  def index
    @articles = Article.order(id: :desc)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  def check_auth
    @article = Article.find(params[:id])

    if current_user.username != @article.author
      flash[:notice] = 'Sorry, you can\'t edit this post'
      redirect_to root_path
    end
  end

end
