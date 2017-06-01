class RemoveTypeFromSpaces < ActiveRecord::Migration[5.0]
  def change
    remove_column :spaces, :type, :string
  end
end
