Rails.application.routes.draw do
  get "api/v1/hello", to: "hello#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]

      resources :scales do
        resources :questions, only: [:index, :create]
        resources :surveys,  only: [:index, :create]   # <-- BUNU istiyoruz
      end

      resources :questions, only: [:show, :update, :destroy] do
        resources :responses, only: [:index, :create]
      end

      resources :surveys,  only: [:show, :update, :destroy] # tekil erişim
      resources :responses, only: [:show, :update, :destroy]
    end
  end
end
