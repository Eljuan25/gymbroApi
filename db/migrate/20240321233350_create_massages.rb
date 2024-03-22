class CreateMassages < ActiveRecord::Migration[7.1]
  def change
    create_table :massages do |t|
      t.string :body

      t.timestamps
    end
  end
end
