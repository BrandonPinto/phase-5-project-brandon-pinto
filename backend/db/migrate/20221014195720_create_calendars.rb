class CreateCalendars < ActiveRecord::Migration[7.0]
  def change
    create_table :calendars do |t|
      t.string :title
      t.string :start
      t.string :end
      t.integer :appointment_id

      t.timestamps
    end
  end
end
