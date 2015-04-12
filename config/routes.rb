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
      get '/logout' => 'sessions#logout'
    end

  end

  namespace :api do
    get '/users' => 'users#index'

    get '/days' => 'days#show'
    get '/days/current_date' => 'days#current_date'
  end

  post '/remote_sign_in' => 'sessions#login', as: :remote_sign_in
end
