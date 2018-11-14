Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'  #directamente accedo desde la pag ppal
  get 'about', to:'pages#about' #welcome controller, about action

  resources :articles

  get 'signup', to: 'users#new'
  # Cambia esta línea por la de abajo: post 'users', to: 'users#create'  #para tener una ruta
  resources :users, except: [:new]

  #Ahora, para que localhost:3000/login tenga una ruta, se la creo. Esto es:
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  #donde recuerdo, sessions es la parte de controler y new es la action que va a hacer.

  resources :categories, except: [:destroy]

end
