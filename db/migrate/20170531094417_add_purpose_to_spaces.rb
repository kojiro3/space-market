class AddPurposeToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :purpose, :string, null: false
  end
end
