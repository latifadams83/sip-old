class CreateArchiveStaffs < ActiveRecord::Migration[5.0]
  def up
    create_table :archive_staffs, id: false do |t|
      t.integer :id
      t.string :staff_id
      t.date :date_join
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :gender, null: false, default: ""
      t.date :date_of_birth
      t.string :qualification
      t.integer :category_id
      t.string :department_id
      t.string :grade
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
      t.boolean :active, null: false, default: true
      t.string :religion
      t.integer :user_id
      t.timestamps
    end
  end
  def down
    drop_table :archive_staffs
  end
end
