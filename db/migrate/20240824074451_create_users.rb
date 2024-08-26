class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users,id: false do |t|
      t.string "provider", null: false
      t.string "name", null: false
      t.string "email", null: false
      t.string  "user_id", null: false, primary_key: true
      t.timestamps
    end
  end
end
