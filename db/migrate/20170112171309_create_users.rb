class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.string :role
      t.string :email, null: false, default: "", limit: 100
      t.string :password_digest
      t.timestamps
    end
    add_index(:users, :email)
  end

  def down
    drop_table :users
  end
end
