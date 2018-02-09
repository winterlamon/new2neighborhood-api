Rails.application.routes.draw do
  resources :venues
  resources :user_venues
  resources :users

  post '/auth', to: 'auth#create'
  get  '/current_user', to: 'auth#show'

  delete '/user_venues', to: 'user_venues#remove'

end
