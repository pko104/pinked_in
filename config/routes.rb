Rails.application.routes.draw do


  root 'profile_pages#index'


  get 'users/:id/live_notifications' => 'users#live_notifications'

  devise_for :users
  resources :users

  resources :profile_pages do
    member do
      post 'newsfeed'
      post 'pink_in'
      get 'profile'
    end
  end

  # patch 'profile_pages/:id/newsfeed' => 'profile_pages#newsfeed', as: :profile_page_newsfeed

  resources :summaries, only: [:create, :update, :destroy]
  resources :experiences, only: [:create, :update, :destroy]
  resources :projects, only: [:create, :update, :destroy]
  resources :languages, only: [:create, :update, :destroy]
  resources :skills, only: [:create, :update, :destroy]
  resources :educations, only: [:create, :update, :destroy]

  resources :messages
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
