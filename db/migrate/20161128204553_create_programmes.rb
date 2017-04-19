class CreateProgrammes < ActiveRecord::Migration[5.0]
  def up
    create_table :programmes do |t|
      t.string :name, null: false
      t.string :code

      t.timestamps
      t.integer :user_id
    end
  end

  def down
    drop_table :programmes
  end
end
