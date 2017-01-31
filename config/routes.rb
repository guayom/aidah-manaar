Rails.application.routes.draw do
  root 'home#index'

  devise_for :students, controllers: { registrations: 'students/registrations' }
  devise_for :instructors
  devise_for :admins

  resources :students do
    collection do
      get :auth
      get :schedule
      get :pay_online
      get :finish_payment
    end
  end

  resources :courses, only: [:index, :show]
  resources :lessons, only: [:index, :show]

  resources :course_students, only: [:create]
  resources :lesson_students, only: [:create]

  # Mass creation of invoices.
  post 'create_invoices' => 'invoices#mass_create'

  get 'track-visit' => 'visits#track_visit'
  resources :payments, only: [:create]

  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'prices' => 'home#prices'
  get 'gracias' => 'home#gracias'
  get 'como-matricular' => 'home#como-matricular'
  get 'import' => 'home#import'
  get 'contrataciones' => 'home#contrataciones'
  get 'contrataciones/gracias' => 'home#gracias'

  get 'select-schedule', to: 'promo#select_schedule'
  get 'thank-you', to: 'promo#thank_you'

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
