class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :personal_event_id
      t.integer :contact_id
      t.text :email
      t.text :username
      t.text :password
      t.text :image
      t.text :alias
      t.text :pronoun

      t.timestamps
    end
  end
end
