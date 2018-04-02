class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  #validates :follower_id, presence: true
  #validates :followed_id, presence: true
  
  belongs_to :followerz, class_name: "User"
  belongs_to :followedz, class_name: "User"
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :active_relationshipzs, class_name:  "Relationshipz",
                                  foreign_key: "followerz_id"
end
