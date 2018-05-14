class CreateExplorersTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :explorers do |t|
  		t.string :username
  		t.string :email
  		t.string :password_digest
  	end
  end
end
