class CreateHypes < ActiveRecord::Migration[5.0]
  def change
    create_table :hypes do |t|
      t.integer :user_id
      t.integer :videogame_id

      t.timestamps
    end
  end
end
