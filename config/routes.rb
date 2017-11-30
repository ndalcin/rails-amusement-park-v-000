Rails.application.routes.draw do

  resources :users
  resources :attractions

  root 'welcome#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  post '/take_ride' => 'rides#take_ride'
end
