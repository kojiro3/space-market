class EventsController < ApplicationController

  def new
    @space = Space.find(params[:space_id])
    @reservation = Reservation.find(params[:reservation_id])
    @event = Event.new
  end

  def create
    @event = Event.new(reservation_params)
    if @event.save
      redirect_to root_path, notice: 'スペースを投稿しました'
    else
      flash.now[:alert] = 'スペースの投稿に失敗しました'
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @space = @event.space
    @reservation = @event.reservation
  end

  private

  def reservation_params
    params.require(:event).permit(:name, :body, :target, user_ids: []).merge(space_id: params[:space_id], reservation_id: params[:reservation_id])
  end
end
