class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :password_digest
      t.boolean :active_member

      t.timestamps
    end
  end
end
