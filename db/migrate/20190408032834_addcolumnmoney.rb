class Addcolumnmoney < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hourfee, :integer
  end
end
