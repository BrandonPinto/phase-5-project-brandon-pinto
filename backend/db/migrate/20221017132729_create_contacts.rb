class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.text :email
      t.text :first_name
      t.text :last_name
      t.text :company
      t.text :phone_number
      t.text :location
      t.text :notes

      t.timestamps
    end
  end
end
