class AddAuthorIdToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author_id, foreign_key: true
  end
end
