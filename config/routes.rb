Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :users do
    resources :deals
  end

  resources :groups
end
