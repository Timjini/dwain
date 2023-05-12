Rails.application.routes.draw do
  devise_for :users
  root 'pages#dashboard'
  get '/login' => 'pages#login'
  get '/dashboard' => 'pages#dashboard'
  get 'dashboard_demo' => 'pages#dashboard_demo'

  # #static pages
  # get 'talks' => 'pages#talks'
  # get 'camps' => 'pages#camps'
  # get 'dcpa' => 'pages#dcpa'
  # get 'groups' => 'pages#groups'
  # get 'thank-you' => 'pages#thank_you'
  # get 'login' => 'pages#login'
  # get 'dwain' => 'pages#dwain'
  # get 'cfs'=> 'pages#faq'
  # get 'form' => 'pages#form'

  #contact form
  resources :contacts, only: [:new, :create, :index]

end
