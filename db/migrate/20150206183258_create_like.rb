class CreateLike < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :thumbs_up, default: 0
      t.integer :message_id, null: false
      t.integer :user_id, null: false
    end
  end
end
