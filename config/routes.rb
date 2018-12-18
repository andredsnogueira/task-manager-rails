Rails.application.routes.draw do
  resources :tasks
  devise_for :administrators
  devise_for :employees
  
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    # list of resources
  end
end
