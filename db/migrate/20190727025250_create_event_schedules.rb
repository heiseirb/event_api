class CreateEventSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :event_schedules do |t|
      t.date :date, null: false
      t.string :status, null: false
      t.integer :capacity, null: false

      t.timestamps
    end
  end
end
