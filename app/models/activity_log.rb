class ActivityLog < ActiveRecord::Base
  validates :CurrentActivity, presence: true
  validates :CurrentMood, presence: true
end
