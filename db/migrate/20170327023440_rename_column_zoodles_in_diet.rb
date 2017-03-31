class RenameColumnZoodlesInDiet < ActiveRecord::Migration[5.0]
  def change
    rename_column :diets, :zoodels, :zoodles
  end
end
