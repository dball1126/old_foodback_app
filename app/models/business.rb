class Business < ActiveRecord::Base
  has_many   :experiences
  belongs_to :category, class_name: "Person", optional: true
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :city
  validates_presence_of :state
  
  geocoded_by :full_address
  after_validation :geocode
  
  def full_address
    [address1, address2, city, state, zipcode].join(', ')
  end
  
  def self.search(params)
    businesses = Business.where(category_id: params[:category].to_i)
    businesses = businesses.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    businesses = businesses.near(params[:location], 20) if params[:location].present?
    businesses
  end
end