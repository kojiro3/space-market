class SpacesController < ApplicationController

  def index
    @spaces = Space.order("created_at DESC").limit(3)
  end

  def new
    @space = Space.new
  end

  def create
    @space = current_owner.spaces.new(space_params)
    if @space.save
      redirect_to root_path, notice: 'スペースを投稿しました'
    else
      flash.now[:alert] = 'スペースの投稿に失敗しました'
      render :new
    end
  end

  def show
    @space = Space.find(params[:id])
    @events = @space.events
  end

  def search
    @spaces = Space.where(purpose: params[:purpose]).order("created_at DESC")
  end

  private

  def space_params
    params.require(:space).permit(:name, :image, :purpose, :text, :start, :finish, :postal_code, :prefecture, :city, :town, :building, :tel, :access, :price, :title, :number).merge(purpose: params[:purpose])
  end
end
