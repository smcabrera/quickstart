Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get '/welcome' => 'welcome#index'

  get '/about' => 'about#index'
  get '/contact' => 'contact#index'

  resources :users, only: [:update]
end
