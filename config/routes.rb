Rails.application.routes.draw do
  devise_for :users
  root to: "gigs#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :gigs, only: [:show, :create, :new] do
    resources :bookings, only: [:new, :create, :index, :destroy]
  end

  resources :bookings, only: [:update]
  get "/dashboard", to: "dashboards#show"

  get "approve/:id", to: 'bookings#approve', as: 'booking_approval'
  get "decline/:id", to: 'bookings#decline', as: 'booking_declined'
  delete '/gigs/:gig_id/bookings/:id', to: 'bookings#destroy', as: 'cancel_booking'

end
