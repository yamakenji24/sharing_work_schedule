# coding: utf-8
Rails.application.routes.draw do
  # 試しに
 
  get "events" => "event#index"
  post "events/create" => "event#create"
  post "events/update" => "event#update"
  post "events/delete" => "event#delete"
  
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "users/option" => "users#change_password"
  post "users/changefee" => "users#change_fee"
  post "users/maximumfee" => "users#maximumfee"
  
  get "users/index" => "users#index"

  #給料計算
  get "users/calc" => "users#calc"
  
  #ユーザ設定
  get "users/option" => "users#option"

  # 新ユーザー登録
  get "users/create_user" => "users#create_userform"
  post "users/create_user" => "users#create_user"

  #dbにシフト追加用                                                                                                                                         
  get "users/new" => "users#new_form"
  post "users/new" => "users#new"
  
  get "users/:user_id" => "users#show"
  get 'shift/index' => "shift#index"
  get "/" => "home#top"
  
  #使い方手引書＆更新内容の表示
  get "home" => "home#home"

  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end

