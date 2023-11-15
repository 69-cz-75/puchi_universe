Rails.application.routes.draw do
  root "scene_photos#index"
  get '/galleries', to: 'scene_photos#index', as: 'galleries'
  get '/museums', to: 'scale_comparison_photos#index', as: 'museums'

  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  devise_for :users, controllers: {
    registrations:  'users/registrations'
  }
end
