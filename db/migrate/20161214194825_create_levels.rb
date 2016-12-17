class CreateLevels < ActiveRecord::Migration[5.0]
  def up
    create_table :levels do |t|
      t.string :level
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :levels
  end
end
