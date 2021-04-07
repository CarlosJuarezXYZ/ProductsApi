Rails.application.routes.draw do
  resources :products
  resources :users, except: [:index]

  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
