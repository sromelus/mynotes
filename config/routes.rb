Rails.application.routes.draw do
  root 'sessions#login'

  get '/sessions/login', to: 'sessions#login', as: :login
  get '/sessions/signup', to: 'sessions#signup', as: :signup
  get '/sessions/new_session', to: 'sessions#login'
  get '/sessions/registration', to: 'sessions#signup'
  post '/sessions/new_session', to: 'sessions#new_session', as: :new_session
  post '/sessions/registration', to: 'sessions#registration', as: :registration
  delete '/sessions/signout', to: 'sessions#destroy_session', as: :signout

  resources :notes, except: :show 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
