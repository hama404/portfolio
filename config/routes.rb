Rails.application.routes.draw do
  root to: "parlors#index"
  get 'home/index'
  devise_for :users

  resources :parlors do
    resources :addresses, only: [:create, :update, :destroy]
    resources :assets, only: [:create, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
