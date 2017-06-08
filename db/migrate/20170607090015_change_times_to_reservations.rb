class ChangeTimesToReservations < ActiveRecord::Migration[5.0]
  def up
    change_column_null :reservations, :times, true
  end

  def down
    change_column_null :reservations, :times, false
  end
end
