class Badge < ApplicationRecord
  RULE_TYPES = %w[all_tests_from_category first_try all_tests_on_level].freeze

  has_many :earned_badges, dependent: :destroy
  has_many :users, through: :earned_badges

  has_one_attached :avatar

  validates :name, presence: true
  validates :description, presence: true
  validates :rule, inclusion: { in: RULE_TYPES }
  validates :value, presence: true, uniqueness: { scope: :rule }
end
