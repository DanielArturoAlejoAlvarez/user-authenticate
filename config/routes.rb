Rails.application.routes.draw do
  root 'home#index'

  get 'auth'        =>  'home#auth'
  post 'user_token' =>  'user_token#create'

  get '/users'      =>  'users#index'
  post '/users/create'     =>  'users#create'

end
