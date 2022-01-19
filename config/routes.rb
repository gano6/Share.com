Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  
  get "/" => "top#index"
  get "/rooms/serch" => "rooms#serch"
  get "/users/mypage" => "users#mypage"
  post "/reservations/new" => "reservations#new"
  
  resources :users
  resources :rooms
  resources :reservations

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
