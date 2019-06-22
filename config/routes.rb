require 'sidekiq/web'

Rails.application.routes.draw do
  get 'search', to: 'search#index',
                as: 'search_index'

  get 'most_popular_movies', to: 'most_popular_movies#index',
                             as: 'most_popular_movies_index'

  get 'blocked_movies', to: 'blocked_movies#index',
                        as: 'blocked_movies_index'
  delete 'blocked_movies/:imdb/delete', to: 'blocked_movies#destroy',
                                        as: 'blocked_movies_destroy'

  get 'watched_movies', to: 'watched_movies#index',
                        as: 'watched_movies_index'
  post 'watched_movies/:imdb/new', to: 'watched_movies#create',
                                   as: 'watched_movies_create'
  delete 'watched_movies/:imdb/destroy', to: 'watched_movies#destroy',
                                         as: 'watched_movies_destroy'

  get 'recommended_movies', to: 'recommended_movies#index',
                            as: 'recommended_movies_index'
  post 'recommended_movies/:imdb/block', to: 'recommended_movies#block',
                                         as: 'recommended_movies_block'

  root 'recommended_movies#index'

  mount Sidekiq::Web => '/sidekiq'
end
