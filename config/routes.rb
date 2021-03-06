Rails.application.routes.draw do
  devise_for :users 
  root to: 'pages#home'
  get "my_bookings", to: "pages#my_bookings",  as: :booking_list
  resources :properties do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: :create
  end
  resources :bookings, only: [ :show, :edit, :update, :destroy ]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
