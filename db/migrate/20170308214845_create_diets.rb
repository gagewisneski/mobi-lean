class CreateDiets < ActiveRecord::Migration[5.0]
  def change
    create_table :diets do |t|
      t.integer :user_id
      t.datetime :date
      t.integer :weight
      t.boolean :moderation1
      t.boolean :moderation2
      t.boolean :moderation3
      t.boolean :option1
      t.boolean :option2
      t.boolean :water1
      t.boolean :water2
      t.boolean :water3
      t.boolean :water4

      t.timestamps
    end
  end
end
