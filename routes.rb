namespace :api do
  namespace :v1 do
    resources :questions do
      resources :responses, only: [:index, :create]
    end
  end
end
