class PagesController < ApplicationController

  def home
    redirect_to articles_path if logged_in?   #lo añane en html119. lo que hace es que home lo lleva siempre a articles en caso de estar logged.
  end

  def about

  end

end