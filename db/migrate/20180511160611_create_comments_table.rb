class CreateCommentsTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :comments do |t|
  		t.integer :explorer_id
  		t.integer :hotspring_id
  		t.string :comment
  	end
  end
end
