class AddBooleanToPEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :personal_events, :p_event, :boolean, :default => true
    #Ex:- :default =>''true

  end
end
