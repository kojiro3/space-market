class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
    @space = Space.find(params[:space_id])
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    @space = Space.find(params[:space_id])
    if @reservation.save
      respond_to do |format|
        format.html { redirect_to space_reservation_path(@space, @reservation), notice: 'スペースを予約しました' }
        format.json { render json: @reservation }
      end
    else
      flash.now[:alert] = 'スペースの予約に失敗しました'
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @space = @reservation.space
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy if reservation.user_id == current_user.id
    redirect_to user_path(current_user)
  end

  private

  def reservation_params
    params.permit(:year, :month, :day, :start, :finish, :price, times: []).merge(space_id: params[:space_id])
  end
end
