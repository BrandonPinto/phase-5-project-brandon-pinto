class CreatePersonalEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_events do |t|
      t.integer :user_id
      t.text :title
      t.text :start
      t.text :end

      t.timestamps
    end
  end
end
