class AddPasswordDigestToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :password_digest, :string
  end
end
