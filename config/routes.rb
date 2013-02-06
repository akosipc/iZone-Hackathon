IZoneHackathon::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }, :skip => [:sessions] do
    delete 'users/sign_out' => 'devise/sessions#destroy', :as => 'destroy_user_session'
  end

  root to: 'pages#index'
end
