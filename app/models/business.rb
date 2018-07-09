class Business < ApplicationRecord
  has_many   :experiences
  has_many   :reviews
  belongs_to :category #added 5 14 18, class_name: "Person", optional: true
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :city
  validates_presence_of :state
  
  has_many :passive_relationshipzs, class_name:  "Relationshipz",
                                   foreign_key: "followedz_id",
                                   dependent:   :destroy
  has_many :followerzs, through: :passive_relationshipzs, source: :followerz
  
  validates_presence_of :full_address
  geocoded_by :full_address
  after_validation :geocode
  
  mount_uploader :image, ImageUploader
  
  
  
  # Follows a Business.
#  def followz(other_business)
#    followingz << other_business
#  end

  # Unfollows a business.
#  def unfollowz(other_business)
#    followingz.delete(other_business)
#  end

  # Returns true if the current user is following the other user.
#  def followingz?(other_business)
#    followingz.include?(other_business)
#  end
 
    def self.import(file)
     CSV.foreach(file.path, headers: true) do |row|
     Business.create! row.to_hash
     end
    end
  
  def full_address
    [address1, city, state, zipcode].join(', ')
  end
  
  def self.search(params)
    #businesses = Business.where(category_id: params[:category].to_i)
  businesses = Business.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    businesses = businesses.near(params[:location], 20) if params[:location].present?
    businesses
  end
end