class CreateUserToEventSchedule < ActiveRecord::Migration[6.0]
  def change
    create_table :user_to_event_schedules do |t|
      t.references :event_schedule, null: false
      t.references :user, null: false
      t.string :status, null: false
      
    end
  end
end
