# coding: utf-8
class EventController < ApplicationController

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
     redirect_to("/shift/index")

      event = Event.new
      event.attributes = {
        #user_id: @current_user.user_id,
        user_name: params[:title],
        start: params[:start],
        end: params[:end]
      }
      event.save
      respond_to do |format|
        format.json {
          render json:
            event.to_json 
            #only: [:title, :start, :end]
          
        }  
      end
  end
end

  
