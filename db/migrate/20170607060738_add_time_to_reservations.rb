class AddTimeToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :times, :integer, null: false
  end
end
