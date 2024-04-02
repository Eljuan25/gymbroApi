class RemoveMassageIdFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :massage_id
  end
end
