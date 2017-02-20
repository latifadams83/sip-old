class CreateHouses < ActiveRecord::Migration[5.0]
  def up
    create_table :houses do |t|
      t.string :name
      t.integer :capacity
      t.text :description
    end
  end

  def down
    drop_table :houses
  end
end
