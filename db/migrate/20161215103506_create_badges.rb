class CreateBadges < ActiveRecord::Migration[5.0]
  def up
    create_table :badges do |t|
      t.string :name
      t.integer :programme_id
      t.integer :grade_level_id
      t.date :start_date
      t.date :end_date
      t.boolean :active, :default => true
      t.timestamps
    end
    add_index("badges", "programme_id")
    add_index("badges", "grade_level_id")
  end

  def down
    drop_table :badges
  end
end
