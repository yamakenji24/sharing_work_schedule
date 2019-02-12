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

  def create
    flash[:notice] = "create method"

    event = Event.new
    event.attributes = {
      #user_id: @current_user.user_id,
      title: params[:title],
      start: params[:start],
      end: params[:end]
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

  
