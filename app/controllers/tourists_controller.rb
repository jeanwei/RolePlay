class TouristsController < ApplicationController

  def home
    @tourist = current_user.as_tourist
  end

  def edit
    @tourist = current_user.as_tourist
    @start_year = set_year(@tourist)
  end

  def update
    @tourist = current_user.as_tourist
    @start_year = set_year(@tourist)
    if @tourist.update_attributes(form_params)
      flash[:notice] = "Your profile was updated successfully."
      redirect_to tourist_home_path
    else
      render :edit
    end
  end

  def assigned_to
    tourist = Tourist.find(params[:tourist_id])
    attribute = "#{params[:entity]}_id=".to_sym
    if tourist.respond_to?(attribute)
      tourist.send(attribute, params[:id]) 
      tourist.save
      flash[:notice] = "Job Seeker was assigned successfully."
    else
      flash[:notice] = "Invalid assignment"
    end
    redirect_to agency_people_home_path
  end

  private
    def set_year(tourist)
      if tourist.year_of_birth
        Date.parse("#{tourist.year_of_birth}0101").year
      else
        Date.today.year - 16
      end
    end

    def form_params
      params.require(:tourist).permit(:year_of_birth)
    end
end

