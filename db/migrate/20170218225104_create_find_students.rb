class CreateFindStudents < ActiveRecord::Migration[5.0]
  def up
    create_table :find_students do |t|
      t.string :first_name
      t.string :last_name
      t.string :student_id
      t.integer :programme_id
      t.integer :level_id
      t.integer :badge_id
      t.string :status
    end
  end
  def down
    drop_table :find_students
  end
end
