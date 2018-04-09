class BusinessesController < ApplicationController
  #before_action :logged_in_user, only: [:index, :create]
  
    
  def index
    @businesses = Business.paginate(page: params[:business])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      flash[:success] = "Business saved!"
      redirect_to @business
    else
      flash[:alert] = "Business not saved!"
      render 'new'
    end
    
  end

  def show
    @business = Business.find(params[:id])
    #redirect_to root_url and return unless @user.activated?
    
    @experiences = Experience.where(business_id: @business)
    @reviews = Review.where(business_id: @business)
    #@experiences = @user.experiences.paginate(page: params[:page])
    #@reviews = @user.reviews.paginate(page: params[:page])
  end

  def followerzs
    @title = "Followerzs"
    @business = Business.find(params[:id])
    @businesses = @business.followerzs.paginate(page: params[:page])
    render 'show_followz'
  end

  def search
    @businesses = Business.search(params)
  end

  private
  
  def business_params
    params.require(:business).permit(:name, :city, :state, :zipcode,                                      :address1, :address2, :category_id, 
                                     :phone, :email, :description, :image)
  end
  
 # def logged_in_user
  #  unless logged_in?
   #   store_location
    #    flash[:danger] = "Please log in."
    #    redirect_to login_url
  #  end
  #end
end