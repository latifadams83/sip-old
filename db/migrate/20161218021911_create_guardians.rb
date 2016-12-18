class CreateGuardians < ActiveRecord::Migration[5.0]
  def up
    create_table :guardians do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :occupation
      t.string :relation
      t.string :address
      t.string :city
      t.string :region
      t.string :phone
      t.string :email
      t.string :education
      t.integer :user_id
      t.timestamps
    end
    add_index("guardians", "user_id")
  end

  def down
    drop_table :guardians
  end
end
