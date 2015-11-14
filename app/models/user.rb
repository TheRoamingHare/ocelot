class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations
  validates :Name, presence: true, length: { maximum: 255 }
  validates :Zip, presence: true, length: { is: 5 }
  validates :Age, presence: true, length: { in: 1..3}

  # Associations
  has_many :ActivityLog
  has_many :ThoughtRecord, through: ActivityLog
end
