class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.boolean :status
    end
  end
end
