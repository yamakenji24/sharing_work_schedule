# coding: utf-8
class EventController < ApplicationController
  #protect_from_forgery
  
  def index
    events = Event.all
    respond_to do |format|
      format.json {
        render json:
        events.to_json(
          only: [:id, :title, :start, :end]
        )
      }
    end
  end

  def update
    @event = Event.find_by(id: params[:id])
    
    @event.start = params[:start]
    @event.end = params[:end]
    @event.daypay = (@event.end - @event.start)/60/60 * @current_user.hourfee
    @event.save
    respond_to do |format|
      format.json {
        render json:
        @event.to_json
      }
    end
  end
  
  def delete
    event = Event.find_by(id: params[:id])
    #binding.pry
    event.delete
    #redirect_to shift_index_path
    #redirect_to("/shift/index")
  end

  def create
    @user = User.find_by(user_id: @current_user.user_id)
    event = Event.new
    event.attributes = {
      title: params[:title],
      start: DateTime.parse(params[:start]),
      end: DateTime.parse(params[:end]),
      user_id: @user.user_id
    }
    event.daypay = (event.end - event.start)/60/60 * @user.hourfee
          
    event.save
  end
end  
