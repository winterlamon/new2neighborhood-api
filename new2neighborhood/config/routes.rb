Rails.application.routes.draw do
  resources :venues
  resources :lists
  resources :users

  post '/auth', to: 'auth#create'
  get  '/current_user', 'auth#show'
  
end
