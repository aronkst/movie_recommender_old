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
      summary: 'After the devastating events of Vingadores: Guerra Infinita ' \
               '(2018), the universe is in ruins. With the help of remaining ' \
               'allies, the Avengers assemble once more in order to undo ' \
               'Thanos\' actions and restore order to the universe.',
      year: 2019,
      genres: 'Action, Adventure, Fantasy'
    )
    assert_not movie.save
  end

  test 'should not save a movie with the empty score column' do
    movie = Movie.new(
      imdb: 'tt4154756',
      title: 'Avengers: Infinity War',
      summary: 'The Avengers and their allies must be willing to sacrifice ' \
               'all in an attempt to defeat the powerful Thanos before his ' \
               'blitz of devastation and ruin puts an end to the universe.',
      year: 2018,
      genres: 'Action, Adventure, Sci-Fi'
    )
    assert_not movie.save
  end

  test 'should not save a movie with the empty title column' do
    movie = Movie.new(
      imdb: 'tt4154664',
      score: 7.1,
      summary: 'Carol Danvers becomes one of the universe\'s most powerful ' \
               'heroes when Earth is caught in the middle of a galactic war ' \
               'between two alien races.',
      year: 2019,
      genres: 'Action, Adventure, Sci-Fi'
    )
    assert_not movie.save
  end

  test 'should not save a movie with the empty summary column' do
    movie = Movie.new(
      imdb: 'tt3501632',
      score: 7.9,
      title: 'Thor: Ragnarok',
      year: 2017,
      genres: 'Action, Adventure, Comedy'
    )
    assert_not movie.save
  end

  test 'should not save a movie with the empty year column' do
    movie = Movie.new(
      imdb: 'tt0848228',
      score: 8.1,
      title: 'The Avengers',
      summary: 'Earth\'s mightiest heroes must come together and learn to ' \
               'fight as a team if they are going to stop the mischievous ' \
               'Loki and his alien army from enslaving humanity.',
      genres: 'Action, Adventure, Sci-Fi'
    )
    assert_not movie.save
  end

  test 'should not save a movie with the empty genres column' do
    movie = Movie.new(
      imdb: 'tt2395427',
      score: 7.3,
      title: 'Avengers: Age of Ultron',
      summary: 'When Tony Stark and Bruce Banner try to jump-start a dormant ' \
               'peacekeeping program called Ultron, things go horribly wrong ' \
               'and it\'s up to Earth\'s mightiest heroes to stop the ' \
               'villainous Ultron from enacting his terrible plan.',
      year: 2015
    )
    assert_not movie.save
  end

  test 'should not save a movie with a score less than 0' do
    movie = Movie.new(
      imdb: 'tt3498820',
      score: -1.0,
      title: 'Captain America: Civil War',
      summary: 'Political involvement in the Avengers\' affairs causes a ' \
               'rift between Captain America and Iron Man.',
      year: 2016,
      genres: 'Action, Adventure, Sci-Fi'
    )
    assert_not movie.save
  end

  test 'should not save a movie with a score greater than 10' do
    movie = Movie.new(
      imdb: 'tt1825683',
      score: 11.0,
      title: 'Black Panther',
      summary: 'T\'Challa, heir to the hidden but advanced kingdom of ' \
               'Wakanda, must step forward to lead his people into a new ' \
               'future and must confront a challenger from his ' \
               'country\'s past.',
      year: 2018,
      genres: 'Action, Adventure, Sci-Fi'
    )
    assert_not movie.save
  end

  test 'should not save a movie with year less than 0' do
    movie = Movie.new(
      imdb: 'tt1211837',
      score: 7.5,
      title: 'Doctor Strange',
      summary: 'While on a journey of physical and spiritual healing, a ' \
               'brilliant neurosurgeon is drawn into the world of the ' \
               'mystic arts.',
      year: -1,
      genres: 'Action, Adventure, Fantasy'
    )
    assert_not movie.save
  end

  test 'should save a movie if the values are correct' do
    movie = Movie.new(
      imdb: 'tt2015381',
      score: 8.1,
      title: 'Guardians of the Galaxy',
      summary: 'A group of intergalactic criminals must pull together to ' \
               'stop a fanatical warrior with plans to purge the universe.',
      year: 2014,
      genres: 'Action, Adventure, Comedy'
    )
    assert movie.save
  end

  test 'should not save a movie with the same imdb' do
    Movie.create(
      imdb: 'tt3896198',
      score: 7.7,
      title: 'Guardians of the Galaxy Vol. 2',
      summary: 'The Guardians struggle to keep together as a team while ' \
               'dealing with their personal family issues, notably ' \
               'Star-Lord\'s encounter with his father the ambitious ' \
               'celestial being Ego.',
      year: 2017,
      genres: 'Action, Adventure, Comedy'
    )
    movie = Movie.new(
      imdb: 'tt3896198',
      score: 7.7,
      title: 'Guardians of the Galaxy Vol. 2',
      summary: 'The Guardians struggle to keep together as a team while ' \
               'dealing with their personal family issues, notably ' \
               'Star-Lord\'s encounter with his father the ambitious ' \
               'celestial being Ego.',
      year: 2017,
      genres: 'Action, Adventure, Comedy'
    )
    assert_not movie.save
  end
end
