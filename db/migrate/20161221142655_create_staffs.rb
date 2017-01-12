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
      t.integer :academic_record_id
      t.integer :staff_grade_id
      t.integer :staff_category_id
      t.integer :staff_department_id
      t.integer :staff_position_id
      t.date :date_of_first_appointment
      t.string :marital_status
      t.string :spouse_name
      t.integer :no_of_children
      t.string :image
      t.string :address
      t.string :city
      t.string :region
      t.string :phone
      t.string :mobile
      t.string :email
      t.string :status, null: false, default: :Current
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
