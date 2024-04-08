Rails.application.routes.draw do
  devise_for :admins, :skip => [:registrations]
  as :admin  do
    get 'admins/edit' => 'admins/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'admins/registrations#update', :as => 'admin_registration'
  end
  devise_for :users
  authenticated :admin do
    root to: 'admins/dashboard#index', as: :authenticated_admin_root
    namespace :admins do

    end
  end
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
