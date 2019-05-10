# coding: utf-8
class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :option]}

  def change_password
     if @current_user.authenticate(params[:oldpass])
      if params[:newpass] == params[:checknewpass] && !params[:newpass].blank?
        @error_message = "パスワードを更新しました"
        @current_user.password = params[:newpass]
        @current_user.save
      else
        @error_message = "新しいパスワードが一致していません"
      end
     else
      @error_message = "現パスワードが間違っています"
     end
     render("/users/option")
  end

  def maximumfee
    if params[:maxfee] =~ /^[0-9]+$/
      flash[:notice] = "限度額を再設定しました"
      @current_user.maximumfee = params[:maxfee]
      @current_user.save
    end
    render("/users/option")
  end
  
  def change_fee
    if params[:newfee] =~ /^[0-9]+$/
      flash[:notice] = "時給を更新しました"
      @current_user.hourfee = params[:newfee]
      @current_user.save
    end
    render("/users/option")         
  end
  
  def option
    
  end

  def calc
    @events = Event.where(user_id: @current_user.user_id).order(start: "DESC")
    @monthly = Array.new(12,0)
    @tmp = 1
    @total = 0
    
    12.downto(1){|x|
      @events.each do |event|
        if event.start.month == x
          @monthly[x-1] += event.daypay
        end
      end
    }
  end
  
  def login_form

  end
  
  def login
    @user = User.find_by(user_id: params[:user_id])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.user_id
      if @user.hourfee.nil?
        @user.hourfee = 920
        @user.save
      end
      if @user.maximumfee.nil?
        @user.maximumfee = 103
        @user.save
      end
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
    @events = Event.where(user_id: @users.user_id).order(start: "DESC")
    @calcmoney = CalcMoney.where(user_id: @current_user.user_id)          
    
  end

  def create_userform

  end
  
  def create_user
    @users = User.new(
      name: params[:name],
      user_id: params[:user_id],
      password: "0000",
      admin: 0,
      shop_cord: 1111,
      hourfee: 920
    )
    if @users.save
      flash[:notice] = "新規登録しました"
      redirect_to("/users/#{@current_user.user_id}")
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
