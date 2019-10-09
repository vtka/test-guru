class AddQuestionsCountToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :question_count, :integer
  end
end
