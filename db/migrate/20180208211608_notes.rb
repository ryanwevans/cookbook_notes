class Notes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.text :content
      t.integer :cookbook_id
      t.integer :user_id
    end
  end
end
