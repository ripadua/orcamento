Rails.application.routes.draw do
  get 'clientes/new_cliente_from_orcamento' => 'clientes#new_from_orcamento', as: :new_cliente_from_orcamento
  
  get 'orcamentos/new/:cliente_id' => 'orcamentos#new_from_cliente', as: :new_orcamento_from_cliente
  
  resources :orcamentos
  resources :servicos
  devise_for :usuarios
  resources :clientes
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'orcamentos#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  
  #get '/clientes/consultacep/:cep' => 'clientes#consulta_cep'
  
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  get 'consultacep/:cep' => 'clientes#consulta_cep', as: :consulta_cep
  
  get 'orcamentos/:id/print' => 'orcamentos#print', as: :print_orcamento
  
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
