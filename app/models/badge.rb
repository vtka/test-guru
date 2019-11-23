class Badge < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  # validates :title, uniqueness: { scope: :level,
  #                                 message: 'only one test of this kind per level' }
end
