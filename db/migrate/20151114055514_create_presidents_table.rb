class CreatePresidentsTable < ActiveRecord::Migration
  def change

  	create_table :presidents do |t|
      
      t.string :fname
      t.string :lname
   
  	end
  end
end
