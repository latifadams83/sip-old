class AddImgFieldAndReligiousDenoToStudents < ActiveRecord::Migration[5.0]
  def up
    add_column :students, :image, :string
    add_column :students, :denomination, :string
  end

  def down
    remove_column :students, :image, :string
    remove_column :students, :denomination, :string
  end
end
