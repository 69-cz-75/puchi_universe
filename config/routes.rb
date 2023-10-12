Rails.application.routes.draw do
  root "galleries#index"
  get 'galleries/index'
  get 'museums/index'

  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  devise_for :users, controllers: {
    registrations:  'users/registrations'
  }

  devise_scope :user do
    delete 'users/sign_out', to: 'users/sessions#destroy'
  end
end
