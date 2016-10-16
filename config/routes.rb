Rails.application.routes.draw do
  
  get '/about', to: 'pages#about'
  get '/editor', to: 'pages#editor'

  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
