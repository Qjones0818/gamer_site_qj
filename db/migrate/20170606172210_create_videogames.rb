class CreateVideogames < ActiveRecord::Migration[5.0]
  def change
    create_table :videogames do |t|
      t.string :title
      t.text :description
      t.string :image_url

      t.timestamps

    end
  end
end
