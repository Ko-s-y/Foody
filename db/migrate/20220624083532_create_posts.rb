class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :post_content
      t.references :user, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
