class CreateGradeLevels < ActiveRecord::Migration[5.0]
  def up
    create_table :grade_levels do |t|
      t.string :name
      t.integer :level
      t.integer :next_level
    end
  end

  def down
    drop_table :grade_levels
  end
end
