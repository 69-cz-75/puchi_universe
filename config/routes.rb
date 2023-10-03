Rails.application.routes.draw do
  root "galleries#index"
  get 'galleries/index'
  get 'museums/index'

  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
end
