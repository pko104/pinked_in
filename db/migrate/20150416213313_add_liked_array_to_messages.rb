class AddLikedArrayToMessages < ActiveRecord::Migration
 def change
    add_column :messages, :liked_ids_array, :string
  end
end
