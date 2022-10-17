class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :comment_body
      t.text :boby
      t.integer :user_id
      t.integer :member_id
      t.integer :post_id
      t.integer :image_id

      t.timestamps
    end
  end
end
