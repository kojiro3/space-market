class RemoveBodyToSpaces < ActiveRecord::Migration[5.0]
  def change
    remove_column :spaces, :body, :text
  end
end
