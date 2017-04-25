class CreateUsersPrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :users_programs do |t|
      t.integer :user_id
      t.integer :program_id

      t.timestamps
    end
  end
end
