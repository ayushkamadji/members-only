Rails.application.routes.draw do
  root 'posts#index'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'

  resources :posts, only: [:index, :create]
end
