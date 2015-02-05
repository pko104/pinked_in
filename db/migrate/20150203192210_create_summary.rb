class CreateSummary < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.text :description, null: false
      t.integer :user_id, null: false
    end
  end
end
