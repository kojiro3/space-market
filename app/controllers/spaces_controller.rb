class SpacesController < ApplicationController

  def index
    @spaces = Space.order("created_at DESC")
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
  end

  private

  def space_params
    params.require(:space).permit(:name, :image, :purpose, :text, :hour, :postal_code, :prefecture, :city, :town, :building, :tel, :access, :price).merge(purpose: params[:purpose])
  end
end
