class AddAuthorIdToTests < ActiveRecord::Migration[5.2]
  def change
    # add_reference :tests, :author, foreign_key: {to_table: :users}
    add_column :tests, :author_id, :integer
    add_index :tests, :author_id
  end
end
