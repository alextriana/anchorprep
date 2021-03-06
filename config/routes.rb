Rails.application.routes.draw do


  devise_for :admins
  resources :updates
  resources :users
  resources :events
  resources :colleges

  get '/home', to: 'static_pages#home', as: 'home'
  get '/about', to: 'static_pages#about', as: 'about'
  get '/resources', to: 'static_pages#resources', as: 'resources'
  get '/contact', to: 'static_pages#contact', as: 'contact'
  get '/college-spotlight', to: 'colleges#index', as: 'college-spotlight'
  get '/articles', to: 'updates#index', as: 'news'
  get '/services', to: 'static_pages#services', as: 'services'
  get '/events', to: 'events#index', as: 'recent-events'


  get '/admin_dashboard',  to: 'admins#index', as: 'admin_dashboard'

  root 'static_pages#home'

  post '/contact-form', to: 'static_pages#submit_contact_form', as: 'submit_contact_form'
  post '/mailer/signup', to: 'users#create', as: 'mailer_signup'

  devise_scope :admin do
    get "/admin", to: "devise/sessions#new", as: 'admin_index'
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with 'rake routes'.

  # You can have the root of your site routed with 'root'
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
