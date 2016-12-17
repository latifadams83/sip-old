class CreateBadges < ActiveRecord::Migration[5.0]
  def up
    create_table :badges do |t|
      t.string :name
      t.integer :programme_id
      t.integer :level_id
      t.date :start_date
      t.date :end_date
      t.boolean :active, :default => true
      t.timestamps
    end
  end

  def down
    drop_table :badges
  end
end
