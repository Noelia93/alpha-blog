class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  # Lo que se hace con el before_action es llamar al set_article que tenemos definido abajo para no tener que repetir
  # código, ya que todo ello estaba escrito en edit, update, show, destroy. De este modo compactamos y ahorramos
  # líneas.

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
    # do something
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
      end
     end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :descriptions)
    end

end