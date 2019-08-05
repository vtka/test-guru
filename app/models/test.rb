class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: :User, foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, presence: true

  validates :level, numericality: { only_integer: true }

  validate :validate_level_format

  validates :title, uniqueness: true

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (title) { 
    joins(:category)
    .where(categories: {title: title})
    .order(title: :desc).pluck(:title) }

  private

  def validate_level_format
    errors.add(:level) if level.to_i < 0
  end
end
