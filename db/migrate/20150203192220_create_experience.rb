class CreateExperience < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :title, null: false
      t.string :company_name, null: false
      t.string :date, null: false
      t.text :description, null: false
      t.integer :user_id, null: false
    end
  end
end
