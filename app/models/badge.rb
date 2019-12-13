class Badge < ApplicationRecord
  has_many :earned_badges, dependent: :destroy
  has_many :users, through: :earned_badges

  has_one_attached :avatar

  validates :name, presence: true
  validates :description, presence: true
  validates :rule, uniqueness: { scope: :value,
                                message: 'only one badge of this rule and value is allowed' }
end
