class AddQuestionsCountToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :questions_count, :integer
  end
end
