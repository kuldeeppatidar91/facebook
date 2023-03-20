Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    default_url_options :host => "localhost:3000"
  resources :users 
  resources :posts do
  resources :comments 
  resources :likes
  end

resources :comments do
  resources :likes
end

resources :users  do
 resources :friendships

end

resources :comments do
  resources :comments 
end
resources :users do
 resources :messages
 end 


    # resources :posts
    # post "/post" ,to: "posts#create"
   # end

    # post "/likes",to: "likes#create"
    post "/login" ,to: "users#login"
      
end
