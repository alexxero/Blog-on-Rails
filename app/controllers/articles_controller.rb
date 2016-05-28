class ArticlesController < ApplicationController

  def new

  end

  def create
    @article = Article.new(article_params)

    if @article.valid?
      @article.save
      redirect_to @article
    else
      render action: 'new'
    end

  end

  def show
    @article = Article.find(params[:id])
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

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
