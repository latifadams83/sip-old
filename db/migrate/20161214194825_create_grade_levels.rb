class CreateGradeLevels < ActiveRecord::Migration[5.0]
  def up
    create_table :grade_levels do |t|
      t.integer :level
      t.string :name
    end
  end

  def down
    drop_table :grade_levels
  end
end
