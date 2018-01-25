class BusinessesController < ApplicationController
  before_action :logged_in_user, only: [:index, :create]
  
    
  def index
    @businesses = Business.paginate(page: params[:page])
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
      redirect_to root_url
    end
  end

  def show
    @business = Business.find(params[:id])
  end

  private
  
  def business_params
    params.require(:business).permit(:name, :description, :address1,
                                      :address2, :city, :state, :zipcode,
                                      :phone, :email)
  end
  
  def logged_in_user
    unless logged_in?
      store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
    end
  end
end