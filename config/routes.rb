# coding: utf-8
Rails.application.routes.draw do
  # 試しに
 
  get "events" => "event#events"
  post "events/create" => "event#create"
  post "events/update" => "event#update"
  
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "users/index" => "users#index"

  # 新ユーザー登録
  get "users/new_user" => "users#new_userform"
  post "users/new_user" => "users#new_user"
  
  # ログアウト用
  post "logout" => "users#logout"

  #dbにシフト追加用                                                                                                                                         
  get "users/new" => "users#new_form"
  post "users/new" => "users#new"
  
  get "users/:user_id" => "users#show"
  get 'shift/index' => "shift#index"
  get "/" => "home#top"
  
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end

