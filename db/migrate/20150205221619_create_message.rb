class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id, null: :false
      t.integer :liked, default: 0
      t.text :message, null: :false
    end
  end
end
