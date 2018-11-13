Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'  #directamente accedo desde la pag ppal
  get 'about', to:'pages#about' #welcome controller, about action

  resources :articles

  get 'signup', to: 'users#new'
  # Cambia esta línea por la de abajo: post 'users', to: 'users#create'  #para tener una ruta
  resources :users, except: [:new]

end
