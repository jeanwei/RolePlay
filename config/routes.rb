Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'tourists/home' => 'tourists#home', as: :tourist_home
  patch 'tourists/:tourist_id/assigned_to/:entity/:id' => 'tourists#assigned_to', as: :tourist_assigned_to
  get 'agency_people/home' => 'agency_people#home', as: :agency_people_home
  resources :tourists, except: [:new, :create, :index]
  root to: 'main#index'
end
