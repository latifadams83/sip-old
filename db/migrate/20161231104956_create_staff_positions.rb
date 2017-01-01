class CreateStaffPositions < ActiveRecord::Migration[5.0]
  def up
    create_table :staff_positions do |t|
      t.string :name
      t.integer :staff_category_id
      t.timestamps
    end
  end

  def down
    drop_table :staff_positions
  end
end
