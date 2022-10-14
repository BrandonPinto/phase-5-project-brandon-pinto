class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :gift_name
      t.integer :gift_price

      t.timestamps
    end
  end
end
