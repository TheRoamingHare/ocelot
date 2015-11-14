class User < ActiveRecord::Base
  # Validations
  before_save { self.Email  Email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :Name, presence: true, length: { maximum: 255 }
  validates :Zip, presence: true, length: { is: 5 }
  validates :Age, presence: true, length: { in: 1..3}
  validates :Email, presence: true, length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }

  # Associations
  has_many :ActivityLog
  has_many :ThoughtRecord, through: ActivityLog
end
