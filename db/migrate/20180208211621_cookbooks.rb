class Cookbooks < ActiveRecord::Migration[5.1]
  def change
    create_table :cookbooks do |t|
      t.string :cookbook_name
      t.integer :user_id
      t.integer :note_id
    end
  end
end
