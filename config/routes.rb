Rails.application.routes.draw do
  root "scene_photos#index"
  get '/galleries', to: 'scene_photos#index', as: 'galleries'
  get '/galleries/new', to: 'scene_photos#new'
  post '/galleries/create', to: 'scene_photos#create'
  get '/museums', to: 'scale_comparison_photos#index', as: 'museums'
  get '/museums/new', to: 'scale_comparison_photos#new'
  post '/museums/create', to: 'scale_comparison_photos#create'

  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  devise_for :users, controllers: {
    registrations:  'users/registrations'
  }
end
