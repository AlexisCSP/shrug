Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to:'static_pages#homepostlogin', as: 'homepostlogin'
  get '/about', to: 'static_pages#aboutpage', as: 'aboutpage'
  get 'help', to: 'static_pages#helppage', as: 'helppage'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users
end