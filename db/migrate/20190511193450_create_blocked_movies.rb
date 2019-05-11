class CreateBlockedMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :blocked_movies do |t|
      t.string :imdb

      t.timestamps
    end
  end
end
