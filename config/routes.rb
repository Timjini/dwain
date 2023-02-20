Rails.application.routes.draw do
  # root 'pages#comingsoon'
  root 'pages#index'

  #static pages
  get 'contact' => 'pages#contact'
  get 'talks' => 'pages#talks'
  get 'camps' => 'pages#camps'
  get 'dcpa' => 'pages#dcpa'
  get 'groups' => 'pages#groups'
  get 'cfs' => 'pages#cfs'
  get 'thank-you' => 'pages#thank_you'
  get 'login' => 'pages#login'
  get 'dwain' => 'pages#dwain'
  get 'faq'=> 'pages#faq'
  get 'form' => 'pages#form'

  #contact form
  resources :contacts, only: [:new, :create]

end
