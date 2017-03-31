class AddDefaultsToDiets < ActiveRecord::Migration[5.0]
  def change
    change_column_default :diets, :nuts_and_seeds, 0
    change_column_default :diets, :greek_yogurt, 0
    change_column_default :diets, :cheese, 0
    change_column_default :diets, :almond_butter, 0
    change_column_default :diets, :zoodels, 0
    change_column_default :diets, :spaghetti_squash, 0
    change_column_default :diets, :hummus_and_guac, 0
    change_column_default :diets, :cottage_cheese, 0
    change_column_default :diets, :fruit, 0
    change_column_default :diets, :happy, 0
    change_column_default :diets, :bean, 0
    change_column_default :diets, :chocolate_bar, 0
  end
end
