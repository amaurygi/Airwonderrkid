class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @properties = @user.properties
    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        info_window: render_to_string(partial: "info_window", locals: { property: property })
      }
    end
  end
end
