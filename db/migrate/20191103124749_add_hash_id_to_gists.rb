class AddHashIdToGists < ActiveRecord::Migration[5.2]
  def change
    add_column :gists, :hash_id, :string
  end
end
