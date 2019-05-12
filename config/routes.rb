require 'sidekiq/web'

Rails.application.routes.draw do
  get 'search', to: 'search#index', as: 'search_index'
  get 'search/:imdb/new', to: 'search#new', as: 'search_new'
  post 'search/:imdb/new', to: 'search#create', as: 'search_create'

  get 'most_popular_movies', to: 'most_popular_movies#index', as: 'most_popular_movies_index'
  get 'most_popular_movies/:imdb/new', to: 'most_popular_movies#new', as: 'most_popular_movies_new'
  post 'most_popular_movies/:imdb/new', to: 'most_popular_movies#create', as: 'most_popular_movies_create'

  get 'blocked_movies', to: 'blocked_movies#index', as: 'blocked_movies_index'
  delete 'blocked_movies/:imdb/delete', to: 'blocked_movies#delete', as: 'blocked_movies_delete'

  get 'watched_movies', to: 'watched_movies#index', as: 'watched_movies_index'
  get 'watched_movies/:imdb/edit', to: 'watched_movies#edit', as: 'watched_movies_edit'
  patch 'watched_movies/:imdb/edit', to: 'watched_movies#update', as: 'watched_movies_update'
  delete 'watched_movies/:imdb/delete', to: 'watched_movies#delete', as: 'watched_movies_delete'

  get 'recommended_movies', to: 'recommended_movies#index', as: 'recommended_movies_index'
  get 'recommended_movies/:imdb/new', to: 'recommended_movies#new', as: 'recommended_movies_new'
  post 'recommended_movies/:imdb/new', to: 'recommended_movies#create', as: 'recommended_movies_create'

  root 'welcome#index'

  mount Sidekiq::Web => '/sidekiq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
