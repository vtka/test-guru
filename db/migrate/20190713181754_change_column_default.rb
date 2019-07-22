class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :answers, :correct, from: nil, to: true
    change_column_default :tests, :level, from: nil, to: 3
    change_column_default :results, :status, from: nil, to: false
  end
end
