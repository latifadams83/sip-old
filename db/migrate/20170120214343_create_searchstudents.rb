class CreateSearchstudents < ActiveRecord::Migration[5.0]
  def up
    create_table :searchstudents do |t|
      t.string :first_name
      t.string :last_name
      t.string :placed_id
      t.integer :programme_id
      t.integer :level_id
      t.integer :badge_id
      t.integer :status
    end
  end

  def down
    drop_table :searchstudents
  end
end
