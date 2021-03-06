class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: :User, foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :level, :time_limit, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level,
                                  message: 'only one test of this kind per level' }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, ->(level) { where(level: level).order(title: :desc) }
  scope :by_category, -> (title) { 
      joins(:category)
        .where(categories: { title: title })
        .order(title: :desc) }

  scope :in_category, ->(cat_id) { where(category_id: cat_id) }

  def self.select_title(title)
    by_category(title).pluck(:title)
  end

  def time_limited?
    time_limit.positive?
  end
end
