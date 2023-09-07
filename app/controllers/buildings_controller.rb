class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :home

  def index
    @builds = Building.where(user_id: current_user.id)
  end

  def home
    @builds = Building.all
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    @building.user = User.first
    if @building.save
      redirect_to buildings_path(@building)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @building.update(building_params)
      redirect_to @building, notice: 'Building was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @building.destroy
    redirect_to buildings_url, notice: 'Building was successfully destroyed.'
  end

  private

  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:address, :area_sq_meter, :price, :transaction_type, :bedroom_count, :bathroom_count )
  end
end
