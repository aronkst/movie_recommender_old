class RemoveScoreFromWatchedMovie < ActiveRecord::Migration[5.2]
  def change
    remove_column :watched_movies, :score, :integer
  end
end
