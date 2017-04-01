class AddFastingToDiet < ActiveRecord::Migration[5.0]
  def change
    add_column :diets, :hawaiian_nut_fast, :boolean
    add_column :diets, :hour_fast_18, :boolean
  end
end
