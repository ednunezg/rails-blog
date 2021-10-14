Rails.application.routes.draw do

  root 'posts#index', as: 'home'

  get 'about' => 'pages#about'

  # This nested way of defining resources will give us routes for both posts and comments within posts

  # Posts accessed via getters like page.com/posts/1
  # Comments accessed via getters like page.com/posts/1/comments/3

  resources :posts do 
    resources :comments
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

=begin
  
root 'pages#home'                    #Define a root path ('/')
get 'signin' => 'sessions#signin'    #Create route that maps a URL to controller action  (in this case maps to sessions controller => signin view+method)
resources :users                     #Creates all routes for RESTful resource
resources :users, :only => [:index]  #Creates routes for certain actions
resources :users, :except=> [:index] #Creates routes except specified ones
get 'users/index'                    #Shorthand for connecting route to controller/action
  
=end