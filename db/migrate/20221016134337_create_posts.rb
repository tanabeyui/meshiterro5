class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :shop
      t.text :caption
      t.integer :user_id
      t.integer :member_id

      t.timestamps
    end
  end
end
