class CreateRecommendedMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :recommended_movies do |t|
      t.string :imdb
      t.string :recommended_imdb

      t.timestamps
    end
  end
end
