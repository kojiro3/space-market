class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day, null: false
      t.integer :start, null: false
      t.integer :finish, null: false
      t.references :user, foreign_key: true, index: true
      t.references :space, foreign_key: true, index: true

      t.timestamps
    end
  end
end
