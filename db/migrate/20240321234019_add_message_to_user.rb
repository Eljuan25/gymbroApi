class AddMessageToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :massage, null: false, foreign_key: true
  end
end
