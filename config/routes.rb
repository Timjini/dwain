Rails.application.routes.draw do
 
#  devise_for :coaches, controllers: { sessions: 'devise/sessions' }
  devise_for :users
  devise_for :coaches

  # User routes
  resources :users , only: %i[index show create update destroy new edit] do
          collection do
            get 'dashboard_student'
            get 'profile' , to: 'students#profile'
        end
    end
  
  get 'goals_rewards_achievements' , to: 'students#goals_rewards_achievements'


  resources :teams, only: [:index, :show, :edit, :update, :create, :new]
  resources :student_workouts, only: [:index, :show, :edit, :update, :create, :new]
  
  # Root path for coaches
  authenticated :coach do
    root to: 'coaches#dashboard_coach', as: :coach_root
    get 'coaches/:id', to: 'coaches#show' ,  constraints: { id: /\d+/ }
  end

  resources :coaches, only: [:index, :show, :edit, :update]
  # Coach User Routes 
  get '/my_profile', to: 'coaches#profile'
  # get '/teams', to: 'coaches#teams'

  get'/test_dashboard', to: 'pages#dashboard_student'

  # Student User Routes
  resources :workouts, only: [:index, :show, :edit, :update, :create, :new] do 
    collection do
      get 'gallery'
    end
  end
  resources :teams , only: [:index, :show, :edit, :update, :create, :new]
  
  # Root path for users
  authenticated :user do
    root to: 'students#dashboard_student', as: :user_root
  end
  
  # For non-authenticated users, redirect them to the login page
  root 'pages#login'

  namespace :api do
    namespace :v1 do
      resources :individual_sessions
    end
  end

   resources :training_sessions , only: %i[index show create update destroy new edit] do 
    collection  do
      post :bulk_create
    end
  end

  resources :trainings , only: %i[index show create update destroy new edit] do 
    collection  do
      post :bulk_create
    end
  end

  resources :feedbacks , only: %i[index show edit destroy create new]

  #contact form
  resources :contacts, only: [:new, :create, :index]

  resources :athletes, only: [:new, :create, :index ,:show ,:edit, :update]

end
