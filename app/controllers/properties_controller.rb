class PropertiesController < ApplicationController
  before_action :find_property, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR address ILIKE :query"
      @properties = Property.where(sql_query, query: "%#{params[:query]}%")
    else
      @properties = Property.all
    end
    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        info_window: render_to_string(partial: "info_window", locals: { property: property })
      }
    end
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
    if @property.user == current_user
      @property.update(property_params)
      redirect_to property_path(@property)
    else
      flash[:alert] = "You are not the owner of this property!"
      render :action => :new
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
    params.require(:property).permit(:name,:address,:description,:price, photos: [])
  end
end
