class ChangeDatetypeMaximumfeeOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :maximumfee, :integer, default: 103
  end
end
