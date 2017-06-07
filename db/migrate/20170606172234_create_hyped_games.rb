class CreateHypedGames < ActiveRecord::Migration[5.0]
  def change
    create_table :hyped_games do |t|
      t.integer :videogame_id
      t.integer :user_id

      t.timestamps

    end
  end
end
