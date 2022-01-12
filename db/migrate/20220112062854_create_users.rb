class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, limit: 200, null: false, unique: true, index: true	
      t.string :phone_number, limit: 20, null: false, unique: true, index: true
      t.string :full_name, limit: 200
      t.string :password, limit: 200, null: false
      t.string :key, limit: 100, null: false, unique: true, index: true
      t.string :account_key, limit: 100, unique: true, index: true
      t.string :metadata, limit: 2000

      t.timestamps
    end
  end
end
