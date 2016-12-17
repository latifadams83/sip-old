class CreateTerms < ActiveRecord::Migration[5.0]
  def up
    create_table :terms do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :calendar_id
      t.boolean :active, :default => true

      t.timestamps
    end
    add_index("terms", "calendar_id")
  end

  def down
    drop_table :terms
  end
end
