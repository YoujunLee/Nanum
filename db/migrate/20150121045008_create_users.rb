class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
			t.string :username
			t.string :password
			t.integer :code
			t.string :name
			t.string :number

      t.timestamps
		end
  end
end
