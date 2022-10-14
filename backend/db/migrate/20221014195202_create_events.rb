class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :host_id
      t.integer :event_number
      t.string :name_of_event
      t.integer :min_participant
      t.integer :max_participant
      t.integer :date
      t.integer :time

      t.timestamps
    end
  end
end
