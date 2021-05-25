class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title 
      t.string :description 
      t.string :year
      t.string :genres
      t.integer :IMDB_rating
      t.string :poster
      t.string :fanart
      t.string :starring
      t.string :directors
      t.integer :likes

      t.timestamps
    end
  end
end
