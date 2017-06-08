class ChangeFinishToReservations < ActiveRecord::Migration[5.0]
  def up
    change_column_null :reservations, :finish, true
  end

  def down
    change_column_null :reservations, :finish, false
  end
end
