class AddProgramIdToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :active_member, :boolean
    add_column :users, :program_id, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
