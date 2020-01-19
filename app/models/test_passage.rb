class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_next_question, on: %i[create update]

  before_update :before_update_check_time_limit

  scope :in_category, ->(cat_id) { includes(:test).where(tests: { category_id: cat_id }) }
  scope :success, -> { where(success: true) }
  scope :with_level, ->(level) { includes(:test).where(tests: { level: level }) }

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    mark_as_passed if successful?

    save!
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def successful?
    score_counter >= SUCCESS_PERCENT
  end

  def score_counter
    (correct_questions * 100) / test.questions.count
  end

  def mark_as_passed
    self.success = true
  end

  def time_left
    (created_at.to_i + test.time_limit) - Time.current.to_i
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def set_next_question
    if new_record?
      self.current_question = test.questions.first
    else
      self.current_question = next_question
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_update_check_time_limit
    return unless test.time_limited?

    self.current_question = nil if time_left <= 0
  end
end
