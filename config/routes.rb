Rails.application.routes.draw do
  get 'shift/index'
  get "/" => "home#top"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "shift/index" => "shift#index"
end

