class BuildingsController < ApplicationController
  def index
    @builds = Building.all
  end
end
