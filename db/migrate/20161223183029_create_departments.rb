class CreateDepartments < ActiveRecord::Migration[5.0]
  def up
    create_table :departments do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end
    add_index(:departments, :category_id)
  end

  def down
    drop_table :departments
  end
end
