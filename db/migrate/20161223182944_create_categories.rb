class CreateCategories < ActiveRecord::Migration[5.0]
  def up
    create_table :categories do |t|
      t.string :name, null: false, default: ""
      t.timestamps
    end
  end

  def down
    drop_table :categories
  end
end
