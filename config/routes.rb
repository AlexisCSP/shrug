Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  mount ActionCable.server => '/cable'

  get 'sessions/new'
  root 'static_pages#home'
  get '/home', to:'static_pages#homepostlogin', as: 'homepostlogin'
  get '/about', to: 'static_pages#aboutpage', as: 'aboutpage'
  get '/help', to: 'static_pages#helppage', as: 'helppage'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  post '/update_latlng', to: 'users#update_latlng'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/new_chatroom', to: 'chat_rooms#new'
  post '/new_chatroom',  to: 'chat_rooms#create'
  resources :users
  resources :chat_rooms, param: :id
  resources :messages, only:[:create]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
