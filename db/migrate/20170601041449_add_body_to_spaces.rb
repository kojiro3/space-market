class AddBodyToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :body, :string
  end
end
