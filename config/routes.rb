Rails.application.routes.draw do
  
  devise_for :users
  get "/" => "top#index"
  
  resources :users
  resources :rooms
  resources :reservations
  
  get "/rooms/posts" => "rooms#posts"
  post "/reservations/new" => "reservations#new"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
