class AgencyPeopleController < ApplicationController
  def home
    @tour_guide = current_user.as_tour_guide
    @translator = current_user.as_translator
    @primary_identity = @tour_guide || @translator 
    @tourists = Tourist.all
  end
end
