class CreateVolunteering < ActiveRecord::Migration
  def change
    create_table :volunteerings do |t|
      t.string :organization, null: false
      t.string :role, null: false
      t.string :date, null: false
      t.text :description, null: :false
      t.integer :user_id, null: :false
    end
  end
end
