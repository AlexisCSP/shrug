Rails.application.routes.draw do
  resources :pets
  get 'sessions/new'

  root 'static_pages#home'
  # TODO fix home swap slash
  get '/home', to:'static_pages#homepostlogin', as: 'homepostlogin'
  get '/about', to: 'static_pages#aboutpage', as: 'aboutpage'
  get '/help', to: 'static_pages#helppage', as: 'helppage'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
