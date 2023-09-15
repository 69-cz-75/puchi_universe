Rails.application.routes.draw do
  root "galleries#index"
  get 'galleries/index'
  get 'museums/index'
end
