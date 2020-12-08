Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources :users, only: [:index, :new, :create, :destroy, :edit]

end
