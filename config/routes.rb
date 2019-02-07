Rails.application.routes.draw do
  
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "users/index" => "users#index"
 
  get "users/:user_id" => "users#show"
  get 'shift/index'
  get "/" => "home#top"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "shift/index" => "shift#index"

  
end

