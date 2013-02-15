IZoneHackathon::Application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  mount Foundation::Icons::Rails::Engine => '/fi'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }, :skip => [:sessions] do
    delete 'users/sign_out' => 'devise/sessions#destroy', :as => 'destroy_user_session'
  end

  authenticated do
    root to: 'pages#index'
  end

  root to: 'pages#index'
  match '/features' => 'pages#features', as: :features, via: :get
  match '/pricing' => 'pages#pricing', as: :pricing, via: :get
  match '/about' => 'pages#about', as: :about, via: :get
  match '/thank_you' => 'pages#thank_you', as: :thank_you, via: :get
  match '/filter' => 'pages#filter', as: :filter, via: :post
  match '/invitation' => 'users#invitation', as: :invitation, via: :post
  resources :users, only: ['show', 'edit', 'update']
  match '/invites' => 'users#invites', as: :invites, via: :get
end
