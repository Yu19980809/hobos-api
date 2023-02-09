Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'login', to: 'sessions#login', as: :login
      resources 'users', only: %i[show update]
      resources 'shows', only: %i[index]
    end
  end
end
