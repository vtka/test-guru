class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: :User, foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.sort_desc_test_name_by_category(title)
    joins(:category).where(categories: {title: title}).order(title: :desc).pluck(:title)
  end
end
