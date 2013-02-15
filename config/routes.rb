IZoneHackathon::Application.routes.draw do
  get "applicants/index"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :applicants
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }, :skip => [:sessions] do
    delete 'users/sign_out' => 'devise/sessions#destroy', :as => 'destroy_user_session'
  end

  authenticated do
    root to: 'pages#search'
  end

  root to: 'pages#index'
  match '/features' => 'pages#features', as: :features, via: :get
  match '/pricing' => 'pages#pricing', as: :pricing, via: :get
  match '/about' => 'pages#about', as: :about, via: :get
  match '/thank_you' => 'pages#thank_you', as: :thank_you, via: :get

  resources :users, only: ['show', 'edit', 'update']
  match '/profile' => 'users#show_profile', as: :profile, via: :get
end
