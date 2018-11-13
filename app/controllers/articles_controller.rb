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
    #debugger    #this line is to have de user_id too
    @article = Article.new(article_params)
    @article.user = User.first   #This line has been created in section 6: associations. (to identify the user)
    if @article.save
    # do something
      flash[:success] = "Article was successfully created"  #cambio los flash success sale en verde
      redirect_to article_path(@article)
    else
      render 'new'
      end
     end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"   #cambio los flash success sale en verde
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"   #cambio los flash danger sale en rojo
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