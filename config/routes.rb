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
      get 'users/:id/posts', to: 'users#index'
      get ':user_id/bookMark/posts', to: 'bookmarks#index'
      get ':post_id/bookMark/posts', to: 'bookmarks#create'
      post ':post_id/bookMark/posts', to: 'bookmarks#create'
      delete ':post_id/bookMark/delete', to: 'bookmarks#destroy'
    end
  end
end
