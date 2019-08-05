class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_count
    errors.add(:base, 'max number of answers is 4') if question.answers.count >= 4
  end
end
