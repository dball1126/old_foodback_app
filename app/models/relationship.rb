class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  
  belongs_to :followerz, class_name: "User"
  belongs_to :followedz, class_name: "User"
end
