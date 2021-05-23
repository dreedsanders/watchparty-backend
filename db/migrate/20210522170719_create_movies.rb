class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title 
      t.string :description 
      t.string :year
      t.integer :IMDB_rating

      t.timestamps
    end
  end
end
