Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :clients do
    resources :cases
  end
  
  resources :cases
  resources :lawyers
  resources :messages

  root to: "cases#index"

  get '/lawyers/:id/dashboard', to: 'lawyers#dashboard', as: 'dashboard_lawyer'

end
