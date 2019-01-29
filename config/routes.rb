Rails.application.routes.draw do

#chat
  get 'chat/index'
  get 'chat/new'
  get 'chat/show'

#like
  post '/drink/:id/like', to: 'likes#like_toggle', as:'like_drink'
  # delete '/drink/:id/dislike', to: 'likes#destroy'
#commment
  resources :comments, only: [:create, :destroy]
  
  get 'place/index'

  get 'recipe/index', to: 'recipe#index'
  
# drink
  resources :drink
  # create
  # post 'drink/create', to: 'drink#create'
  # get 'drink/new', to: 'drink#new'
  # # read
  # get 'drink/index', to: 'drink#index'
  # get 'drink/:id', to: 'drink#show', as: 'drink_show'
  # # edit
  # get 'drink/:i d/edit', to:'drink#edit'
  # patch 'updateDrink/:id' , to: 'drink#update', as: 'update'
  # # delete
  # delete 'drink/:id', to: 'drink#destroy', as: "delete"
  
  get '/my_profile', to: 'profiles#show'
  get '/new_profile', to: 'profiles#new'
  post '/create_profile', to: 'profiles#create'
  get '/edit_profile', to: 'profiles#edit'
  patch '/update_profile', to: 'profiles#update'

  root to: 'home#index'
  #devise_for :users
  devise_for :users
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
