Rails.application.routes.draw do
  root 'sessions#new'

  get 'signup', to: 'teachers#new', as: 'signup'
  post 'teachers', to: 'teachers#create'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'teacher_home', to: 'students#index', as: 'teacher_home'
  resources :students, only: [:new, :create, :edit, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
