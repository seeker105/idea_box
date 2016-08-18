Rails.application.routes.draw do
  root 'ideas#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :ideas, only: [:index, :create, :destroy]
      post 'increment', to: 'ideas#increment'
      post 'decrement', to: 'ideas#decrement'
    end
  end
end
