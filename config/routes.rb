Rails.application.routes.draw do
  devise_for :users
  root 'pages#dashboard_demo'
  get '/login' => 'pages#login'
  get '/dashboard' => 'pages#dashboard'

  #contact form
  resources :contacts, only: [:new, :create, :index]

end
