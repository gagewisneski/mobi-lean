class RemoveProgramFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :program_id, :integer
  end
end
