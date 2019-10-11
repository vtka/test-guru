require 'digest/sha1'

class User < ApplicationRecord

  include Auth

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  # def show_passed_tests_by_level(level)
  #   tests.where(level: level)
  # end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
