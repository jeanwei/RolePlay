module ApplicationHelper

  FLASH_TYPE = {
    notice: 'alert-success',
    alert: 'alert-danger',
    info: 'alert-info',
    warning: 'alert-warning'
  }.freeze

  def flash_to_css(key)
    FLASH_TYPE[key.to_sym] || ''
  end

  def homepage_path(user)
    return "/" unless user
    return tourist_home_path if user.is_tourist?
    return agency_people_home_path if user.is_agency_person?
  end
end
