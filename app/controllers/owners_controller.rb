class OwnersController < ApplicationController

  def show
    @owner = Owner.find(params[:id])
    @spaces = @owner.spaces
  end
end
