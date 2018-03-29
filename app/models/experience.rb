class Experience < ActiveRecord::Base
    #belongs_to :comment, :polymorphic => true
    belongs_to :user
    belongs_to :business
    
end