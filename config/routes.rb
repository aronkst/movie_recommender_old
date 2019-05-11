Rails.application.routes.draw do
  get 'watched_movies/index'
  get 'watched_movies/edit'
  get 'search/index'
  get 'search/new'
  get 'blocked_movies/index'
  get 'recommended_movies/index'
  get 'recommended_movies/new'
  get 'most_popular_movies/index'
  get 'most_popular_movies/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
