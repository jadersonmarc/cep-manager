Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  namespace :api, defaults: { format: :json } do
    resources :users, only: %i[show create update destroy]    
    resources :addresses, only: %i[index]
  end
end
