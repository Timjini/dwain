Rails.application.routes.draw do
  resources :training_sessions
  devise_for :coaches
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]

  resources :coaches, only: [:index, :show, :edit, :update]
  
  # Root path for coaches
  authenticated :coach do
    root to: 'coaches#dashboard_coach', as: :coach_root
    get 'coaches/:id', to: 'coaches#show' ,  constraints: { id: /\d+/ }
  end

  # Coach User Routes 
  get '/my_profile', to: 'coaches#profile'
  get '/teams', to: 'coaches#teams'

  resources :workouts, only: [:index, :show, :edit, :update, :create, :new]
  
  # Root path for users
  authenticated :user do
    root to: 'pages#dashboard_student', as: :user_root
  end
  
  # For non-authenticated users, redirect them to the login page
  root 'pages#login'

  namespace :api do
    namespace :v1 do
      resources :individual_sessions
    end
  end

  #contact form
  resources :contacts, only: [:new, :create, :index]

end
