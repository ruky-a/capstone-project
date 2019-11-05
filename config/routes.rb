Rails.application.routes.draw do
  root 'pages#index'
  get 'search', to: 'pages#search'

  devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'registration'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  resources :users, only: :show 
  resources :rooms, only: [:index, :show] do
      resources :reservations, only: [:create]  
        resources :reviews, only: [:create, :destroy]  
      
    end

    get '/your_bookings' => 'reservations#your_bookings'
  namespace :host do
  resources :rooms, only: [:new, :create, :edit, :show, :update, :destroy, :index] do
    member do
    get 'preload'
    get 'preview'

  end

      resources :amenities, only: [:new, :create]
      resources :photos, only: [:create, :destroy]
    end


  end

   get '/your_reservations' => 'reservations#your_reservations'

end