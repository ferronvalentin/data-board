Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'pages#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :client do
    resources :treatments, only: [:new, :create, :index, :edit, :update, :destroy, :show]
  end

  resources :users, only: :show do
    resources :treatments, only: :index
  end

end
