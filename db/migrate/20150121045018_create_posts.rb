class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
			t.integer :user_id
			t.string :category
			t.string :title
			t.string :price
			t.string :number
			t.text :content

      t.timestamps 
    end
  end
end
