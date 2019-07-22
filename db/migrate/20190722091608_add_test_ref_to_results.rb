class AddTestRefToResults < ActiveRecord::Migration[5.2]
  def change
    add_reference :results, :test, foreign_key: true
  end
end
