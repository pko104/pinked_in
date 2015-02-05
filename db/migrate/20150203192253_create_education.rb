class CreateEducation < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school, null: false
      t.string :degree, null: false
      t.string :date, null: false
      t.integer :user_id, null: false
    end
  end
end
