class RemoveTitleToSpaces < ActiveRecord::Migration[5.0]
  def change
    remove_column :spaces, :title, :string
  end
end
