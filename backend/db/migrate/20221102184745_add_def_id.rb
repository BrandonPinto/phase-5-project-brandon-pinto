class AddDefId < ActiveRecord::Migration[7.0]
  def change
    add_column :personal_events, :def_id, :integer
    
  end
end
