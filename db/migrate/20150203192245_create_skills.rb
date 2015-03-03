class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name_of_skill, null: false
      t.integer :user_id, null: false
    end
  end
end
