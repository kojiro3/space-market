class ChangeStartToReservations < ActiveRecord::Migration[5.0]
  def up
    change_column_null :reservations, :start, true
  end

  def down
    change_column_null :reservations, :start, false
  end
end
