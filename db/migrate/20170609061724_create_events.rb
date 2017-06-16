class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.text :target, null: false
      t.references :space, foreign_key: true, index: true
      t.references :reservation, foreign_key: true, index: true

      t.timestamps
    end
  end
end
