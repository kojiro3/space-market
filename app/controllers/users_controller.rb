class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reservations = @user.reservations.order(year: :asc, month: :asc, day: :asc, start: :asc)
    @events = @user.events
  end
end
