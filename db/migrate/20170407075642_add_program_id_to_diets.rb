class AddProgramIdToDiets < ActiveRecord::Migration[5.0]
  def change
    add_column :diets, :program_id, :integer
  end
end
