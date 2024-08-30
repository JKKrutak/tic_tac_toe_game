class CreateGamesPlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :games_players do |t|
		t.belongs_to :game
		t.belongs_to :player
		t.timestamps
    end
  end
end
