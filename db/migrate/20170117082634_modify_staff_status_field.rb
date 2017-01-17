class ModifyStaffStatusField < ActiveRecord::Migration[5.0]
  def up
    change_column(:staffs, :status, :string, null:false, defaut: "current")
  end

  def down
    change_column(:staffs, :status, :boolean, null:false, defaut: true)
  end
end
