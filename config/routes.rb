Rails.application.routes.draw do
  # root 'users#index'

  resources :notes do
    resources :users
  end

  get 'login', to: "users#login"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
