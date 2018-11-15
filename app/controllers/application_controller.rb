class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] # A||= B significa "sino A => haz B"
  end

  #lo que hace es chequear si está iniciado en la sesión o no
  def logged_in?
    !!current_user # !! Lo convierte en boolean!!
  end
  def require_user
    if !logged_in?  #sino está iniciado en sesión entonces manda:
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path     #y se lo lleva a esa dirección
    end
  end

  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end
end