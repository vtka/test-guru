class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_first_question, on: %i[create update]

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    # self.current_question = next_question
    save!
  end

  def current_question_number
    # puts '!!!!!!!!!!!!!!!!!!'
    # puts test.questions.inspect
    # puts current_question.id
    # puts '!!!!!!!!!!!!!!!!!!'
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def successful?
    score_counter >= SUCCESS_PERCENT
  end

  def final_score
    score_counter.to_i
  end

  private

  def score_counter
    (correct_questions * 100) / test.questions.count
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) && correct_answers_count == answer_ids.count
  end

  def set_first_question
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
end
