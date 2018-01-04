class Business < ActiveRecord::Base
  
  has_many   :experiences
  belongs_to :category
  
end