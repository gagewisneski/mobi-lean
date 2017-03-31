class ChangeDateToDayInDiet < ActiveRecord::Migration[5.0]
  def change
    remove_column :diets, :date, :datetime
    add_column :diets, :day, :integer
    remove_column :diets, :water1, :boolean
    remove_column :diets, :water2, :boolean
    remove_column :diets, :water3, :boolean
    remove_column :diets, :water4, :boolean
  end
end
