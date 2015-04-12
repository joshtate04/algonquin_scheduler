Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root :to => "application#index", as: :authenticated_root
    end

    unauthenticated :user do
      root :to => "sessions#new", as: :unauthenticated_root
    end

    authenticate :user do
      get "*path.html" => "application#index", :layout => 0

      namespace :api do
        resources :courses
      end
    end

    get "*path" => "application#index"
  end

  post '/remote_sign_in' => 'application#remote_sign_in', as: :remote_sign_in

  get "/logout" => "sessions#logout", as: :logout
end
