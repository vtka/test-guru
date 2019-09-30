module QuestionHelper
  def question_header(object)
    if object.new_record?
      "Create New #{@question.test.title} Question"
    else
      "Edit #{@question.test.title} Question"
    end
  end
end
