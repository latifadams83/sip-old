class CreateProgrammes < ActiveRecord::Migration[5.0]
  def up
    create_table :programmes do |t|
      t.string :name
      t.string :code
    end
  end

  def down
    drop_table :programmes
  end
end
