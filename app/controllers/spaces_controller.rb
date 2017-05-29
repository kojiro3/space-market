class SpacesController < ApplicationController

  def index
  end

  def new
    @space = Space.new
  end
end
