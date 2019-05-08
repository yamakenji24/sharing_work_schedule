class Addcolumndaypay < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :daypay, :integer
  end
end
