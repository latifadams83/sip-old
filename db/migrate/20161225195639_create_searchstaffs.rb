class CreateSearchstaffs < ActiveRecord::Migration[5.0]
  def up
    create_table :searchstaffs do |t|
      t.string :staff_id
      t.string :first_name
      t.string :last_name
      t.integer :staff_category_id
      t.integer :staff_department_id

    end
  end

  def down
    drop_table :searchstaffs
  end
end
