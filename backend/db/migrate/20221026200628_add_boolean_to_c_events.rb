class AddBooleanToCEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :community_events, :c_event, :boolean, :default => true
    #Ex:- :default =>''
    #Ex:- :default =>''true
    
  end
end
