class AddStartToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :start, :integer
  end
end
