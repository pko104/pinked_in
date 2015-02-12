class AddColumnToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :network_id, :integer, null: false
  end
end
