Rails.application.routes.draw do
  devise_for :users
  root 'main#index'
  get 'main/search' => 'main#search', :as => 'search'
  get 'main/booking' => 'main#booking', :as => 'booking'
  get 'main/view'  => 'main#view',  :as =>  'view'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
