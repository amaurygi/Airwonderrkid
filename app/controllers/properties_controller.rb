class PropertiesController < ApplicationController
  before_action :find_property, only: [:show]

  def index
    @properties = Property.all
  end

  def show
  end


  private

  def find_property
    @property = Property.find(params[:id])
  end
end
