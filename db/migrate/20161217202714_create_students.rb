class CreateStudents < ActiveRecord::Migration[5.0]
  def up
    create_table :students do |t|
      t.string :placed_id
      t.date :placed_date
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :date_of_birth
      t.string :religion
      t.integer :programme_id
      t.integer :level_id
      t.integer :badge_id
      t.string :address
      t.string :city
      t.string :region
      t.string :phone
      t.string :email
      t.integer :guardian_id
      t.integer :user_id

      t.timestamps
    end
    add_index("students", "placed_id")
    add_index("students", "programme_id")
    add_index("students", "level_id")
    add_index("students", "badge_id")
  end

  def down
    drop_table :students
  end
end