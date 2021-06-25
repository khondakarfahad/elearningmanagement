class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone_number
      t.string :password, limit: 128, null: false
      t.integer :role
      t.timestamps
    end
  end
end
