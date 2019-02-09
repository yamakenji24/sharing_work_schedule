# coding: utf-8
class EventController < ApplicationController

  def show

    @event = Event.all
    
    respond_to do |format|
      format.json {
        render json:
        @event.to_json(
          only: [:user_id, :user_name, :start, :end]
        )
      }
    end
  end

  def create
      event = Event.new
      event.attributes = {
        user_id: current_user.id,
        user_name: params[:user_name],
        start: params[:start],
        finish_at: params[:finish_at],
      }
      event.save
      respond_to do |format|
        format.json {
          render json:
            @event.to_json (
            only: [:user_id, :user_name, :start, :end]
            )
          }
      end
  end
end

  
