Rails.application.routes.draw do
  resources :hashtags do
    resources :tweets, only: [:index]  
  end
end
