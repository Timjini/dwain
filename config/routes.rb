Rails.application.routes.draw do
  devise_for :coaches
  devise_for :users
  
  # Root path for coaches
  authenticated :coach do
    root to: 'pages#dashboard_coach', as: :coach_root
  end
  
  # Root path for users
  authenticated :user do
    root to: 'pages#dashboard_student', as: :user_root
  end
  
  # For non-authenticated users, redirect them to the login page
  root 'pages#login'
  

  #contact form
  resources :contacts, only: [:new, :create, :index]

end
