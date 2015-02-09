class CreateNetwork < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.integer :user_id, null: :false
    end
  end
end
