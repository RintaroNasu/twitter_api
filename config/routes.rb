Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index,:create,:show, :update, :destroy,:search] do
        collection do
          get 'search'
        end
      end
      get 'auth/:provider/callback', to: 'users#create'
      post 'auth/:provider/callback', to: 'users#create'
    end
  end
end
