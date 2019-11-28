class Badge < ApplicationRecord
  has_many :earned_badges, dependent: :destroy
  has_many :users, through: :earned_badges

  has_one_attached :avatar

  validates :name, presence: true
  validates :description, presence: true
  # validates :title, uniqueness: { scope: :level,
  #                                 message: 'only one test of this kind per level' }
end
