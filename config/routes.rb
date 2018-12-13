Rails.application.routes.draw do
  resources :tasks
  devise_for :administrators
  devise_for :employees
  member do
    patch:'changestate/:status', to:'tasks#changestate'
    patch:start
    patch:end
  end  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
