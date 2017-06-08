class AddFinishToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :finish, :integer
  end
end
