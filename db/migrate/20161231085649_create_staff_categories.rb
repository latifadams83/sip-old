class CreateStaffCategories < ActiveRecord::Migration[5.0]
  def up
    create_table :staff_categories do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :staff_categories
  end
end
