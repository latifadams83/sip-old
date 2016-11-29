class CreateBadges < ActiveRecord::Migration[5.0]
  def up
    create_table :badges do |t|
      t.string :name
      t.integer :programme_id
      t.timestamps
    end
    add_index("badges", "programme_id")
  end

  def down
    drop_table :badges
  end
end
