class CreateUserToSchedule < ActiveRecord::Migration[6.0]
  def change
    create_table :user_to_schedules do |t|
      t.references :event, null: false
      t.references :user, null: false
    end
  end
end
