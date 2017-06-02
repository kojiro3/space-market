class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
    @space = Space.find(params[:space_id])
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    @space = Space.find(params[:space_id])
    if @reservation.save
      redirect_to space_reservation_path(@space, @reservation), notice: 'スペースを予約しました'
    else
      flash.now[:alert] = 'スペースの予約に失敗しました'
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @space = @reservation.space
  end

  private

  def reservation_params
    params.permit(:year, :month, :day, :start, :finish).merge(space_id: params[:space_id])
  end
end
