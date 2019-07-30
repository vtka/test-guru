class User < ApplicationRecord
  def show_passed_tests_by_level(level)
    Test.joins("INNER JOIN results ON tests.id = results.test_id").where(results: {user_id: self.id}, tests: {level: level})
  end

  # has_and_belongs_to_many :tests
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"
end
