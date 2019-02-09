# coding: utf-8
Rails.application.routes.draw do
  # 試しに
  root to: 'calendar#index'
  get 'calendar/index'
  get 'events', to: 'event#show'
  post 'events/create', to: 'event#create'
  
  
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "users/index" => "users#index"

  # ログアウト用
  post "logout" => "users#logout"
 
  get "users/:user_id" => "users#show"
  get 'shift/index'
  get "/" => "home#top"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "shift/index" => "shift#index"

  
end

