Rails.application.routes.draw do
 root to: "site#index"

 namespace :api, defaults: {format: :json} do
  namespace :v1 do
    resources :data, only: [:index] do
    end
  end
end
end
