class Users < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :note_id
      t.integer :cookbook_id
    end
  end
end
