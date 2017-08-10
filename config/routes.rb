Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dictionary
  resources :translation
  resources :user

  post '/translate', to: 'dictionary#translate'

  get '/dictionary', to: 'dictionary#index'

  post '/authenticate', to: 'user#authenticate'

  root :to=> 'user#login'
end
