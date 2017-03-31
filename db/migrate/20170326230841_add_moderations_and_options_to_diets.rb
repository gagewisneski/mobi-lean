class AddModerationsAndOptionsToDiets < ActiveRecord::Migration[5.0]
  def change
    remove_column :diets, :moderation1, :boolean
    remove_column :diets, :moderation2, :boolean
    remove_column :diets, :moderation3, :boolean
    add_column :diets, :nuts_and_seeds, :integer
    add_column :diets, :greek_yogurt, :integer
    add_column :diets, :cheese, :integer
    add_column :diets, :almond_butter, :integer
    add_column :diets, :zoodels, :integer
    add_column :diets, :spaghetti_squash, :integer
    add_column :diets, :hummus_and_guac, :integer
    add_column :diets, :cottage_cheese, :integer
    remove_column :diets, :option1, :boolean
    remove_column :diets, :option2, :boolean
    add_column :diets, :fruit, :integer
    add_column :diets, :happy, :integer
    add_column :diets, :bean, :integer
    add_column :diets, :chocolate_bar, :integer
  end
end
