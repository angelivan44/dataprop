class PhotosController < ApplicationController
  before_action :set_building
  before_action :set_photo, only: [:edit, :update, :destroy, :photo_modal]

  def index
    redirect_to @building
  end

  def new
    @photo = @building.photos.new
  end

  def create
    @photo = @building.photos.new(photo_params)
    if @photo.save
      redirect_to building_photos_path(@building), notice: 'Photo was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to building_photos_path(@building), notice: 'Photo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to building_photos_path(@building), notice: 'Photo was successfully destroyed.'
  end

  def photo_modal
    # Código para la modal aquí si es necesario, de lo contrario, puedes eliminar este método.
  end

  private

  def set_photo
    @photo = @building.photos.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:priority, :image)
  end

  def set_building
    @building = Building.find(params[:building_id])
  end
end
