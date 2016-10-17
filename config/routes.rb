Rails.application.routes.draw do

  devise_for :users
  
  resources :posts do
    resources :comments
  end
  get '/about', to: 'pages#about'
  get '/editor', to: 'pages#editor'
  get '/blog', to: 'posts#index'

  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
