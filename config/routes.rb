Rails.application.routes.draw do
  resources :tasks
  devise_for :administrators
  devise_for :employees
  
  namespace :api,  defaults: { format: :json } do
    resources :tasks
  end
end
