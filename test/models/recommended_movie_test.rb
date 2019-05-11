require 'test_helper'

class RecommendedMovieTest < ActiveSupport::TestCase
  test 'não deve salvar um filme recomendado vazio' do
    recommended_movie = RecommendedMovie.new()
    assert_not recommended_movie.save
  end

  test 'não deve salvar um filme recomendado apenas com a coluna imdb' do
    recommended_movie = RecommendedMovie.new(imdb: 'tt4154796')
    assert_not recommended_movie.save
  end

  test 'não deve salvar um filme recomendado apenas com a coluna recommended_imdb' do
    recommended_movie = RecommendedMovie.new(recommended_imdb: 'tt4154796')
    assert_not recommended_movie.save
  end

  test 'não deve salvar um filme recomendado com a coluna imdb e recommended_imdb com valores iguais' do
    recommended_movie = RecommendedMovie.new(imdb: 'tt4154796', recommended_imdb: 'tt4154796')
    assert_not recommended_movie.save
  end

  test 'deve salvar o filme recomendado com todos os valores preenchidos' do
    recommended_movie = RecommendedMovie.new(imdb: 'tt4154796', recommended_imdb: 'tt4154756')
    assert recommended_movie.save
  end

  test 'não deve salvar um filme recomendado se ja existir uma linha com a coluna imdb e recommended_imdb com os mesmos valores' do
    RecommendedMovie.create(imdb: 'tt4154796', recommended_imdb: 'tt4154756')
    recommended_movie = RecommendedMovie.new(imdb: 'tt4154796', recommended_imdb: 'tt4154756')
    assert_not recommended_movie.save
  end
end
