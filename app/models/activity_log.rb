class ActivityLog < ActiveRecord::Base
  # Validations
  validates :CurrentActivity, presence: true
  validates :CurrentMood, presence: true


  #Associations
  belongs_to :User
  has_one :ThoughtRecord



end
