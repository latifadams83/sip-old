class CreateStaffs < ActiveRecord::Migration[5.0]
  def up
    create_table :staffs do |t|
      t.string :staff_id
      t.date :date_join
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :gender, null: false, default: ""
      t.date :date_of_birth
      t.string :qualification
      t.string :specialization
      t.string :grade
      t.string :job_description
      t.string :date_of_first_appointment
      t.string :marital_status
      t.string :spouse_name
      t.integer :no_of_children
      t.string :image
      t.string :address
      t.string :city
      t.string :region
      t.string :phone
      t.string :email
      t.boolean :active, null: false, default: true
      t.string :religion
      t.integer :user_id

      t.timestamps
    end
    add_index :staffs, :email
  end

  def down
    drop_table :staffs
  end
end
