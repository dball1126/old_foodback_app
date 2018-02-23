class ExperiencesController < ApplicationController
  before_action :logged_in_user, only: [:index, :create]
  before_action :set_business
  
  def new
    @experience = Experience.new(business: @business)
  end
  
  def create
    @experience = current_user.experiences.build(experience_params)
    @experience.business = @business
    @experience.save
    redirect_to @business
  end
  
  
  private
  
  def experience_params
    params.require(:experience).permit(:comment)
  end
  
  def set_business
    @business = Business.find(params[:business_id])
  end
end