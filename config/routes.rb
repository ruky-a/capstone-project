Rails.application.routes.draw do
  root 'pages#index'
  get 'search', to: 'pages#search'

  devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'registration'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  resource :dashboard, only: [:show] 
  resources :users, only: [:show ] do
    member do 
      post '/verify_phone_number' => 'users#verify_phone_number'
      patch 'update_phone_number' => 'users#update_phone_number'
    end
  end
     resources :rooms, only: [:index, :show] do
      resources :reservations, only: [:create]  
      
      
    end

    get '/your_bookings' => 'reservations#your_bookings'
  namespace :host do
  resources :rooms, only: [:new, :create, :edit, :show, :update, :destroy, :index] do
    member do
    get 'preload'
    get 'preview'
    get 'photo_upload'

  end

      resources :amenities, only: [:new, :create]
      resources :photos, only: [:create, :destroy]
    end


  end
    resources :guest_reviews, only: [:create, :destroy]
    resources :host_reviews, only: [:create, :destroy]
    resources :reservations, only: [:approve, :decline] do
      member do 
        post '/approve' => "reservations#approve"
        post '/decline' => "reservations#decline"
      end
    end
   

   get '/your_reservations' => 'reservations#your_reservations'
   get '/payment_method' => "users#payment"
   post '/add_card' => "users#add_card"

end