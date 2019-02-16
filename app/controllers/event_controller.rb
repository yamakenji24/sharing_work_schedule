# coding: utf-8
class EventController < ApplicationController
  protect_from_forgery
  
  def events
    @event = Event.all
    respond_to do |format|
      format.json {
        render json:
        @event.to_json(
          only: [:title, :start, :end]
        )
      }
    end
  end

  def update
    @event = Event.find_by(params[:id])
    @event.attributes = {
      start: params[:start],
      end: params[:end]
    }
    @event.save
    respond_to do |format|
      format.json {
        render json:
        @event.to_json
      }
    end
  end
  
  def create
    @user = User.find_by(user_id: @current_user.user_id)
    event = Event.new
    event.attributes = {
      title: params[:title],
      start: params[:start],
      end: params[:end],
      user_id: @user.user_id
    }
    event.save
    respond_to do |format|
      format.json {
        render json:
        event.to_json 
        #only: [:user_name, :start_time, :end_time]          
      }  
    end
  end
end  
