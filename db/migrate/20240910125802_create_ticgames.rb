class CreateTicgames < ActiveRecord::Migration[7.1]
  def change
    create_table :ticgames do |t|
	  t.string :state
      t.timestamps
    end
  end
end
