class CreateSearchStaffs < ActiveRecord::Migration[5.0]
  def up
    create_table :search_staffs do |t|
      t.string :lastname
      t.string :firstname
      t.string :staff_id
      t.integer :category
      t.integer :department
    end
  end

  def down
    drop_table :search_staffs
  end
end
