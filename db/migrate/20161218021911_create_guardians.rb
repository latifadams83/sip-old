class CreateGuardians < ActiveRecord::Migration[5.0]
  def up
    create_table :guardians do |t|
      t.string :first_name
      t.string :last_name
      t.string :occupation
      t.string :address
      t.string :city
      t.string :region
      t.string :phone
      t.string :email
      t.string :education
      t.string :relation
      t.string :father_name
      t.string :father_occupation
      t.string :father_hometown
      t.string :father_homeregion
      t.string :mother_name
      t.string :mother_occupation
      t.string :mother_hometown
      t.string :mother_homeregion
      t.integer :user_id
      t.string :status, null: false, default: :current
      t.timestamps
    end
  end

  def down
    drop_table :guardians
  end
end
