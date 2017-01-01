class Searchstaff < ApplicationRecord
  belongs_to :staff_category
  belongs_to :staff_department

  def staff_members

    staffs = Staff.all

    staffs = staffs.where(["staff_category_id = ?", staff_category_id]) if staff_category_id.present?
    staffs = staffs.where(["staff_department_id = ?", staff_department_id]) if staff_department_id.present?
    staffs = staffs.where(["staff_id LIKE ?", staff_id]) if staff_id.present?
    staffs = staffs.where(["first_name LIKE ?", first_name]) if first_name.present?
    staffs = staffs.where(["last_name LIKE ?", last_name]) if last_name.present?

    return staffs
  end
end
