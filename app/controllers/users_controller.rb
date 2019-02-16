# coding: utf-8
class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show]}
  
  def login_form

  end
  
  def login
    @users = User.find_by(user_id: params[:user_id], password: params[:password])
    if @users
      session[:user_id] = @users.user_id
      flash[:notice] = "ログインしました"
      redirect_to("/shift/index")
    else
      @error_message = "ユーザIDまたはパスワードが間違っています"
      @user_id = params[:user_id]
      @password = params[:password]
      render("/users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
  
  def index
    @users = User.all
  end

  def show
    @users = User.find_by(user_id: params[:user_id])
    @events = Event.where(user_id: @users.user_id)
  end

  def new_userform

  end
  
  def new_user

  end
  #admin権限でdbにシフトを追加可能に
  def new_form

  end
  def new
    @users = User.find_by(name: params[:name])
    
    if @users
      @event = Event.new(
        user_id: @users.user_id,
        month: params[:month],
        day: params[:day],
        start: params[:start],
        end: params[:end],
      )
      @event.save
      flash[:notice] = "登録しました"
      redirect_to("/users/new")
      
    else
      @error_message = "未登録のユーザーです"
      render("/users/new")
    end
  end
end
