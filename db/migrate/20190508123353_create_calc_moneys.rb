class CreateCalcMoneys < ActiveRecord::Migration[5.2]
  def change
    create_table :calc_moneys do |t|
      t.integer :Year
      t.integer :Month
      t.integer :MonthlyFee
      t.integer :user_id

      t.timestamps
    end
  end
end
