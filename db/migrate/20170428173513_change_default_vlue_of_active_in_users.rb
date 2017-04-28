class ChangeDefaultVlueOfActiveInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :activated, true
  end
end
