Rails.application.routes.draw do
  devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'registration'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks'}
  resources :users, only: :show
  root 'pages#index'
  resources :rooms, only: [:index, :show]
  namespace :host do
  resources :rooms, except: [:edit] do
      resources :amenities, only: [:new, :create]
      resources :photos, only: [:create, :destroy, :new]
    end
  end
end
