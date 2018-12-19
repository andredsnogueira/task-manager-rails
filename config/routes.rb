Rails.application.routes.draw do
  resources :tasks
  devise_for :administrators
  devise_for :employees
  
  namespace :api do
    post 'auth' => 'authentication#authenticate_employee'
    get 'home' => 'tasks#index'
  end
end
