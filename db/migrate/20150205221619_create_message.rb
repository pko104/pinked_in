class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
     # t.integer :liked_id
      t.text :description, null: :false
      t.integer :user_id, null: :false
      t.timestamps
    end
  end
end
