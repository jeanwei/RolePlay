class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def signed_in_root_path(resource)
    if resource.is_tourist?
      tourist_home_path
    elsif resource.is_agency_person?
      agency_people_home_path
    else
      "/"
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || signed_in_root_path(resource)
  end

end
