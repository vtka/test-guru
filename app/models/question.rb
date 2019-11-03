class Question < ApplicationRecord
  belongs_to :test, counter_cache: true
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :body, presence: true
end
