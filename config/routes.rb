Rails.application.routes.draw do
 root to: "site#index"

 namespace :api, defaults: {format: :json} do
  namespace :v1 do
    resources :data, only: [:index]
    resources :devices, only: [:index]
    resources :zones, only: [:index]
  end
end
end
