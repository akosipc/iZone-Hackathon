IZoneHackathon::Application.routes.draw do
  get "applicants/index"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :applicants
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }, :skip => [:sessions] do
    delete 'users/sign_out' => 'devise/sessions#destroy', :as => 'destroy_user_session'
  end

  root to: 'pages#index'
end
