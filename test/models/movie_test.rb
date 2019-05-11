require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test 'não deve salvar um filme vazio' do
    movie = Movie.new
    assert_not movie.save
  end

  test 'não deve salvar um filme com a coluna imdb vazia' do
    movie = Movie.new(
      score: 8.8,
      title: 'Avengers: Endgame',
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      year: 2019,
      genres: 'Action, Adventure, Fantasy',
    )
    assert_not movie.save
  end

  test 'não deve salvar um filme com a coluna score vazia' do
    movie = Movie.new(
      imdb: 'tt4154796',
      title: 'Avengers: Endgame',
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      year: 2019,
      genres: 'Action, Adventure, Fantasy',
    )
    assert_not movie.save
  end

  test 'não deve salvar um filme com a coluna title vazia' do
    movie = Movie.new(
      imdb: 'tt4154796',
      score: 8.8,
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      year: 2019,
      genres: 'Action, Adventure, Fantasy',
    )
    assert_not movie.save
  end

  test 'não deve salvar um filme com a coluna summary vazia' do
    movie = Movie.new(
      imdb: 'tt4154796',
      score: 8.8,
      title: 'Avengers: Endgame',
      year: 2019,
      genres: 'Action, Adventure, Fantasy',
    )
    assert_not movie.save
  end

  test 'não deve salvar um filme com a coluna year vazia' do
    movie = Movie.new(
      imdb: 'tt4154796',
      score: 8.8,
      title: 'Avengers: Endgame',
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      genres: 'Action, Adventure, Fantasy',
    )
    assert_not movie.save
  end

  test 'não deve salvar um filme com a coluna genres vazia' do
    movie = Movie.new(
      imdb: 'tt4154796',
      score: 8.8,
      title: 'Avengers: Endgame',
      summary: 'After the devastating events of Vingadores: Guerra Infinita (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to undo Thanos\' actions and restore order to the universe.',
      year: 2019,
    )
    assert_not movie.save
  end

  test 'não deve salvar um filme com o score menor que 0' do
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

  test 'não deve salvar um filme com o score maior que 10' do
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

  test 'não deve salvar um filme com o year menor que 0' do
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

  test 'deve salvar um filme se os valores estiverem corretos' do
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

  test 'não deve salvar um filme com o mesmo imdb' do
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
