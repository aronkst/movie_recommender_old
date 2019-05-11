require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test 'should not save an empty movie' do
    movie = Movie.new
    assert_not movie.save
  end

  test 'should not save a movie with the empty imdb column' do
    movie = Movie.new(
      score: 8.8,
      title: 'Avengers: Endgame',
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      year: 2019,
      genres: 'Action, Adventure, Fantasy',
    )
    assert_not movie.save
  end

  test 'should not save a movie with the empty score column' do
    movie = Movie.new(
      imdb: 'tt4154796',
      title: 'Avengers: Endgame',
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      year: 2019,
      genres: 'Action, Adventure, Fantasy',
    )
    assert_not movie.save
  end

  test 'should not save a movie with the empty title column' do
    movie = Movie.new(
      imdb: 'tt4154796',
      score: 8.8,
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      year: 2019,
      genres: 'Action, Adventure, Fantasy',
    )
    assert_not movie.save
  end

  test 'should not save a movie with the empty summary column' do
    movie = Movie.new(
      imdb: 'tt4154796',
      score: 8.8,
      title: 'Avengers: Endgame',
      year: 2019,
      genres: 'Action, Adventure, Fantasy',
    )
    assert_not movie.save
  end

  test 'should not save a movie with the empty year column' do
    movie = Movie.new(
      imdb: 'tt4154796',
      score: 8.8,
      title: 'Avengers: Endgame',
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      genres: 'Action, Adventure, Fantasy',
    )
    assert_not movie.save
  end

  test 'should not save a movie with the empty genres column' do
    movie = Movie.new(
      imdb: 'tt4154796',
      score: 8.8,
      title: 'Avengers: Endgame',
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      year: 2019,
    )
    assert_not movie.save
  end

  test 'should not save a movie with a score less than 0' do
    movie = Movie.new(
      imdb: 'tt4154796',
      score: -1.0,
      title: 'Avengers: Endgame',
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      year: 2019,
      genres: 'Action, Adventure, Fantasy',
    )
    assert_not movie.save
  end

  test 'should not save a movie with a score greater than 10' do
    movie = Movie.new(
      imdb: 'tt4154796',
      score: 11.0,
      title: 'Avengers: Endgame',
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      year: 2019,
      genres: 'Action, Adventure, Fantasy',
    )
    assert_not movie.save
  end

  test 'should not save a movie with year less than 0' do
    movie = Movie.new(
      imdb: 'tt4154796',
      score: 8.8,
      title: 'Avengers: Endgame',
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      year: -1,
      genres: 'Action, Adventure, Fantasy',
    )
    assert_not movie.save
  end

  test 'should save a movie if the values are correct' do
    movie = Movie.new(
      imdb: 'tt4154796',
      score: 8.8,
      title: 'Avengers: Endgame',
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      year: 2019,
      genres: 'Action, Adventure, Fantasy',
    )
    assert movie.save
  end

  test 'should not save a movie with the same imdb' do
    Movie.create(
      imdb: 'tt4154796',
      score: -1.0,
      title: 'Avengers: Endgame',
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      year: 2019,
      genres: 'Action, Adventure, Fantasy',
    )
    movie = Movie.new(
      imdb: 'tt4154796',
      score: -1.0,
      title: 'Avengers: Endgame',
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      year: 2019,
      genres: 'Action, Adventure, Fantasy',
    )
    assert_not movie.save
  end
end
