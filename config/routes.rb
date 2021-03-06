Rails.application.routes.draw do
  root 'ideas#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :ideas, only: [:index, :create, :destroy]
      post 'increment/:id', to: 'ideas#increment'
      post 'decrement/:id', to: 'ideas#decrement'
      post 'update/:id', to: 'ideas#update'
    end
  end
end
