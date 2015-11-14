class ActivityLog < ActiveRecord::Base
  # Validations
  validates :CurrentActivity, presence: true
  validates :CurrentMood, presence: true
end
