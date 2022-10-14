class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :calendar_id
      t.string :email
      t.string :username
      t.string :password
      t.string :image
      t.string :alias
      t.string :pronoun

      t.timestamps
    end
  end
end
