class AddmaximumfeeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :maximumfee, :integer
  end
end
