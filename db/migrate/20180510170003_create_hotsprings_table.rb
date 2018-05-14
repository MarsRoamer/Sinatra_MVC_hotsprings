class CreateHotspringsTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :hotsprings do |t|
  		t.string :name
  		t.string :city
  		t.string :state
  		t.string :directions
  		t.string :description
  		t.integer :explorer_id
  	end
  end
end
