Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'main#index'
  get 'main/search' => 'main#search', :as => 'search'
  get 'main/booking' => 'main#booking', :as => 'booking'
  get 'main/view'  => 'main#view',  :as =>  'view'
  get 'main/success' => 'main#success', :as => 'success'
  get 'admin/index' => 'admin#index', :as => 'admin'
  get 'admin/new_guests' => 'admin#new_guests', :as => 'new_guests'
  get 'admin/guests' => 'admin#guests', :as => 'guests'
  get 'admin/add_new_guests' => 'admin#add_new_guests', :as => 'add_new_guests'
  get 'admin/success_to_add' => 'admin#success_to_add', :as => 'success_to_add'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
