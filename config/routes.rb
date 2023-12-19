Rails.application.routes.draw do
  root "scene_photos#index"

  resources :galleries, controller: 'scene_photos', path: 'galleries'

  resources :museums, only: [:index, :show, :new, :create], controller: 'scale_comparison_photos', path: 'museums'

  get '/my_page/:id', to: 'my_pages#show', as: :my_page
  #get '/mypage/gallery', to: 'my_pages#index', as: 'user_gallery'

  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  devise_for :users, controllers: {
    registrations:  'users/registrations'
  }
end
