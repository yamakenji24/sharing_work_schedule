# coding: utf-8
class UsersController < ApplicationController
  def login_form

  end
  
  def login
    @users = User.find_by(name: params[:name], password: params[:password])
    if @users
      flash[:notice] = "ログインしました"
      redirect_to("/users/index")
    else
      flash[:notice] = "ログイン失敗しました"
      render("/users/login_form")
    end
  end
  
  def index
    @users = User.all
  end

  def show
    @users = User.find_by(user_id: params[:user_id])
  end
  
end
