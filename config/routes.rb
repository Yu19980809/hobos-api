Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'login', to: 'sessions#login', as: :login
      resources 'users', only: %i[show update] do
        resources :bookings, only: :index
        resources :club_followings, only: :index
        resources :comedian_followings, only: :index
      end
      resources 'shows', only: %i[index show create update destroy]
      resources 'bookings', only: %i[create destroy]
      resources 'club_followings', only: %i[create destroy]
      resources 'comedian_followings', only: %i[create destroy]
      resources 'clubs', only: :create
    end
  end
end
