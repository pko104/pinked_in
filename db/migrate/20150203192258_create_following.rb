class CreateFollowing < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.string :title, null: false
      t.string :area, null: false
      t.integer :user_id, null: false
    end
  end
end
