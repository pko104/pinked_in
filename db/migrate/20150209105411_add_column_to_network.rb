class AddColumnToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :connected_ids_array, :string
  end
end
