Rails.application.routes.draw do
  devise_for :workers
  devise_for :users
  root 'landing#index'

  resources :workers
  resources :jobs, only: [:index]
  resources :users do
    resources :jobs
  end
end
