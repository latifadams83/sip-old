class CreateAcademicRecords < ActiveRecord::Migration[5.0]
  def up
    create_table :academic_records do |t|
      t.string :type
      t.string :cert_earned
      t.string :institution
      t.string :duration
      t.integer :staff_id
      t.timestamps
    end
  end

  def down
    drop_table :academic_records
  end
end
