class CreateSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :spaces do |t|
      t.string :name, null: false
      t.string :image
      t.string :type, null: false
      t.text :text, null: false
      t.text :hour
      t.integer :postal_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :town, null: false
      t.string :building
      t.string :tel, null: false
      t.text :access, null: false
      t.integer :price, null: false
      t.references :owner, foreign_key: true, index: true

      t.timestamps
    end
  end
end
