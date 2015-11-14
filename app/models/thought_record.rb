class ThoughtRecord < ActiveRecord::Base
  # Validations
  validates :CurrentSituation, presence: true
  validates :Emotions, presence: true
  validates :FirstEmotionStrength, presence: true,
  validates :AutoThoughts, presence: true
  validates :AltResponse, presence: true
  validates :SecondEmotionStrength, presence: true

  # Associations
  belongs_to :ActivityLog

end
