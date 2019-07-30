class Test < ApplicationRecord
  def self.sort_desc_test_name_by_category(title)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where(categories: {title: title}).order(title: :desc).pluck(:title)
  end

  has_many :questions
  belongs_to :category
  # has_and_belongs_to_many :users
  has_many :tests_users
  has_many :users, through: :tests_users
end
