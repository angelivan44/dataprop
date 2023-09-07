class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit,  :update, :destroy]
  before_action :set_photos, only: [:edit, :show]
  before_action :authenticate_user!, except: [:home, :show]

  def index
    @builds = Building.where(user_id: current_user.id).page(params[:page]).per(8)
  end

  def home
    @builds = Building.all.page(params[:page]).per(8)
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    @building.user = current_user
    if @building.save
      redirect_to @building, notice: 'Edificio creado con éxito.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    @photos = Photo.where(building_id: params[:id])
    p "---"*100
    p @photos
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

  def set_photos
    @photos = Photo.where(building_id: params[:id])
  end

  def building_params
    params.require(:building).permit(
      :address,
      :area_sq_meter,
      :price,
      :transaction_type,
      :bedroom_count,
      :bathroom_count,
      photos_attributes: [:id, :image, :_destroy]
    )
  end
end
