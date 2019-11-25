class AddRuleToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :rule, :string
  end
end
