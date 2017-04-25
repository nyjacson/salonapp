Rails.application.routes.draw do
  devise_for :admins
  root 'static_pages#home'
  #get 'shopinfos/index'
  resources :shopinfos do
      collection do
          post :import
          get 'download', to: 'shopinfos#download'
      end
      resources :shopbranches do
          collection do
              post :import
              get 'download', to: 'shopbranches#download'
          end
      end
  end
  # resources :shopbranches do
  #     collection do
  #         post :import
  #     end
  # end
  get 'static_pages/home'
  get 'static_pages/toku1'
  get 'static_pages/toku2'
  get 'static_pages/admin'
  get 'search/tokyo1'
  get 'search/tokyo2'
  get 'search/ginza'
  get 'search/shinjuku'
  get 'search/shibuya'
  get 'search/ikebukuro'
  get 'search/hokkaido'
  get 'search/tohoku'
  get 'search/kanto'
  get 'search/chubu'
  get 'search/kansai'
  get 'search/chugoku'
  get 'search/shikoku'
  get 'search/kyushu'
  get 'search/chiba'
  get 'search/kanagawa'
  get 'search/tochigi'
  get 'search/gunma'
  get 'search/ibaraki'
  get 'search/saitama'
  get 'admin', to: 'static_pages#admin'

  resources :shopfbs do
      collection do
          post :import
          get 'download', to: 'shopfbs#download'
      end
  end
  resources :articles do
      collection do
          post :import
          get 'download', to: 'articles#download'
      end
  end

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
