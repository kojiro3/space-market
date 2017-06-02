class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
    @space = Space.find(params[:space_id])
  end
end
