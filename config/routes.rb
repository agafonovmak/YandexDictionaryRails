Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dictionary
  resources :translation

  post '/translate', to: 'dictionary#translate'

  root :to=> 'dictionary#index'
end
