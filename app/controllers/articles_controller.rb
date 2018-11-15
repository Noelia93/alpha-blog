class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  # Lo que se hace con el before_action es llamar al set_article que tenemos definido abajo para no tener que repetir
  # código, ya que todo ello estaba escrito en edit, update, show, destroy. De este modo compactamos y ahorramos
  # líneas.
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  #Después de haber instalado la paginación, voy amodificar estas líneas para que aparezca mejor.
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  # con per_page: 5 lo que le digo es cuántos voy a querer por página
  def new
    @article = Article.new
  end

  def edit
  end

  def create
    #debugger    #this line is to have de user_id too
    @article = Article.new(article_params)
    @article.user = current_user #User.first (lo cambia video 120)  #This line has been created in section 6: associations. (to identify the user)
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
    def article_params   #el ultimo parametro es el de categorias que es de la forma arrays
      params.require(:article).permit(:title, :descriptions, category_ids: [])
    end

    def require_same_user
      if current_user != @article.user and !current_user.admin? #el admin puede edit y delete
        flash[:danger] = "You can only edit or delete your own articles"
        redirect_to root_path
      end
    end
end