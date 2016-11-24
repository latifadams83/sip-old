class CreateProgrammes < ActiveRecord::Migration[5.0]
  def up
    create_table :programmes do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :programmes
  end
end
