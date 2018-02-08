class Business < ActiveRecord::Base
  has_many   :experiences
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :address1
  
  geocoded_by :full_address
  after_validation :geocode
  
  def full_address
    [address1, address2, city, state, zipcode].join(', ')
  end
  
end