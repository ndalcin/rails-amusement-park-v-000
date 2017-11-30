Rails.application.routes.draw do

  resources :users
  root 'welcome#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :attractions
  post '/take_ride' => 'rides#take_ride'
end
