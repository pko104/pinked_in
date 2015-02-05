class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name, null: false
      t.string :proficiency, null: false
      t.integer :user_id, null: false
    end
  end
end
