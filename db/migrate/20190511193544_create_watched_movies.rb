class CreateWatchedMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :watched_movies do |t|
      t.string :imdb
      t.integer :score

      t.timestamps
    end
  end
end
