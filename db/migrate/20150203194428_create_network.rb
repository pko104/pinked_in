class CreateNetwork < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.integer :user_id
    end
  end
end
