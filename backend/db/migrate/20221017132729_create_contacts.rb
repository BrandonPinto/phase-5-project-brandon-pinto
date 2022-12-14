class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.text :email
      t.text :first_name
      t.text :last_name
      t.text :company
      t.text :phone_number
      t.text :address
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
