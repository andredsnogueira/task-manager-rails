Rails.application.routes.draw do
  resources :companies
  resources :tasks
  devise_for :administrators
  devise_for :employees
  
  namespace :api do
    scope 'v1' do
      post 'login' => 'authentication#authenticate_employee'
      # scope 'tasks' do
      #   get '' => 'tasks#index'
      #   get ':id' => 'tasks#show'
      # end
      scope 'employees' do
        scope 'tasks' do
          get '' => 'tasks#employees'
          put ':id/:field' => 'tasks#update'
        end
      end
    end
  end
end
