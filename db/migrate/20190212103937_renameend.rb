class Renameend < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :start_time, :start
    rename_column :events, :end_time, :end
    rename_column :events, :user_name, :title
  end
end
