# coding: utf-8
class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show]}
  
  def login_form

  end
  
  def login
    @user = User.find_by(user_id: params[:user_id])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.user_id
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

  def create_userform

  end
  
  def create_user
    @users = User.new(
      name: params[:name],
      user_id: params[:user_id],
      password: "0000",
      admin: 0,
      shop_cord: 1111
    )
    if @users.save
      flash[:notice] = "新規登録しました"
      redirect_to("/users/create_userform")
    else
      @error_message = "新規ユーザ登録失敗"
      render("/users/create_userform")
    end
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
