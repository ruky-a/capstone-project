Rails.application.routes.draw do
  devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'registration'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks'}
  root 'pages#index'
  namespace :host do
    resources :rooms, only: [:new, :create, :show]
  end
end
