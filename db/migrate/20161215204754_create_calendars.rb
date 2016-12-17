class CreateCalendars < ActiveRecord::Migration[5.0]
  def up
    create_table :calendars do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :active, :default => true
      t.timestamps
    end
  end

  def down
    drop_table :calendars
  end
end
