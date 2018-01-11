Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :path_names => { :sign_up => "register/orizon/blockchain/sign_up" }
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :client do
    resources :treatments, only: [:new, :create, :index, :edit, :update, :destroy, :show]
  end

  resources :users, only: [:new, :create, :index, :edit, :update, :destroy, :show] do
    resources :treatments, only: :index

  end

  # resources :treatments, only: :index

  get "/question" => "pages#show", :as => '/question'

  get "client/faq" => "users#faq", :as => 'client/faq'

  # post 'create_user' => 'users#create', as: :create_user

end
