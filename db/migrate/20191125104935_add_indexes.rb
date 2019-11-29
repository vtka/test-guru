class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :earned_badges, [:user_id, :badge_id]
  end
end
