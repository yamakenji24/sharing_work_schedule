class AddUserAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :integer
  end
end
