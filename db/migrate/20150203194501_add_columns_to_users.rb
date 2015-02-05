class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_page_id, :integer, null: :false
    add_column :users, :location, :string, null: false
    add_column :users, :industry, :string, null: false
  end
end
