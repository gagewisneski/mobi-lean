class ChangeProgramDatesToStrings < ActiveRecord::Migration[5.0]
  def change
    change_column :programs, :start_date, :string
    change_column :programs, :end_date, :string
  end
end
