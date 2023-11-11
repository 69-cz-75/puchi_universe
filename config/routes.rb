Rails.application.routes.draw do
  root "scene_photos#index"
  get 'scene_photos/index', to: 'scene_photos#index', as: 'galleries'
  get 'museums/index'

  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  devise_for :users, controllers: {
    registrations:  'users/registrations'
  }
end
