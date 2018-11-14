class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Alpha blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  # con edit lo que crea es la página para poder editar usuario y contraseña
  def edit     #se fija en http://localhost:3000/users/5/edit  ese 5 es el id
    @user = User.find(params[:id])
  end

  #con estas lineas conseguimos que cuando se escriban los datos de la edicion se guarden
  def update
    @user = User.find(params[:id])
    if @user.update(user_params) #user_params es username, mail y password esta def abajo en private
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end



#esto es para la parte de signup. Me creo la variable user para poder usarla en ew.html.erb por ejemplo.