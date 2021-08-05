class PropertiesController < ApplicationController
  before_action :find_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @property.update(property_params)
      @property.user = current_user
      redirect_to property_path(@property)
    else
      render :edit
    end
  end

  def destroy
    @property.delete
    redirect_to properties_path
  end


  private

  def find_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name,:address,:description,:price)
  end
end
