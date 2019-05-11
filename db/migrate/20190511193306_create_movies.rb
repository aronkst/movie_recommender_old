class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :imdb
      t.float :score
      t.string :title
      t.text :summary
      t.integer :year
      t.string :genres

      t.timestamps
    end
  end
end
