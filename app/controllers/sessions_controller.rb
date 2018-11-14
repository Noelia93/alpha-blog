#Este controler surge de la ruta que he creado en routes con get 'login', to: sessions#new. Entonces necesito un
# controlador que en eeste caso es este archivo.
class SessionsController < ApplicationController

  # render a form
  def new

  end

  #for submition
  # lo que se hace en lo siguiente es para que cuando alguien va a entrar compuebe que el username esta registrado
  # y despues que la contraseña está bien de acuerdo a la que se introdujo cd se inscribio.
  def create        #básicamente es lo que hace en el html 115, vídeo 114.
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

  #for login out
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end