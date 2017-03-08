class ChangeColumnWeightToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :diets, :weight, :decimal, precision: 4, scale: 1
  end
end
