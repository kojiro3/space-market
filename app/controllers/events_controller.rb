class EventsController < ApplicationController

  def new
    @space = Space.find(params[:space_id])
    @reservation = Reservation.find(params[:reservation_id])
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
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

  def update
    @event = Event.find(params[:id])
    @event.users << current_user
    if @event.save
      redirect_to root_path, notice: 'イベント参加が完了しました'
    else
      flash.now[:alert] = 'イベント参加に失敗しました'
      render :show
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.users.delete(current_user)
    if @event.save
      redirect_to root_path, notice: 'イベントのキャンセルが完了しました'
    else
      flash.now[:alert] = 'イベントのキャンセルに失敗しました'
      render :show
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :body, :target, user_ids: []).merge(space_id: params[:space_id], reservation_id: params[:reservation_id])
  end
end
