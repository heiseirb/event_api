class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :owner, null: false
      t.string :place, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
