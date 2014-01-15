class CreateSpacecats < ActiveRecord::Migration
  def up
  	create_table :spacecats do |t|
  		t.string :name
  		t.string :homeplanet
  		t.string :tagline 
  		t.string :superpower
  		t.timestamps 
    end
  end

  def down
    drop_table :spacecats
  end
end
