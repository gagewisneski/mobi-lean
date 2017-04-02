class AddCheatMealToDiet < ActiveRecord::Migration[5.0]
  def change
    add_column :diets, :cheat_meal, :boolean
  end
end
