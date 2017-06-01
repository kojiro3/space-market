class AddTitleToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :title, :string
  end
end
