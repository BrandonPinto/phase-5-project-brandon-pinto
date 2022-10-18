class CreateCommunityEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :community_events do |t|
      t.integer :user_id
      t.integer :max_participant
      t.integer :min_participant
      t.text :title
      t.text :start
      t.text :end


      t.timestamps
    end
  end
end
