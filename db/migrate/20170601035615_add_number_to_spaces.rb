class AddNumberToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :number, :integer, null: false
  end
end
