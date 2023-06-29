Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "users#login"
   resources :users
   post '/login' => 'users#login_user'

   get '/my' => 'users#hello'
   # get '/new1' => 'users#new1'
   # post '/create1' => 'users#create1'

   get "/del" => "users#del"
end
