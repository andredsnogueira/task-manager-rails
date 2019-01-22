Rails.application.routes.draw do
  resources :companies
  resources :tasks
  devise_for :administrators
  devise_for :employees
  
  namespace :api do
    scope 'v1' do
      post 'login' => 'authentication#authenticate_employee'
      scope 'employees' do
        post 'location' => 'locations#location'
        get 'notifications' => 'notifications#employees'
        get 'company' => 'companies#current'
        scope 'tasks' do
          get '' => 'tasks#employees'
          put ':id/:field' => 'tasks#update'
          get 'today' => 'tasks#today'
        end
      end
    end
  end
end
