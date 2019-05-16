class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :bike, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :rider, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
