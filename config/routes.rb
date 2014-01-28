Issuet::Application.routes.draw do
  root 'dashboard#index'

  devise_for :users
  get 'users/:username', to: 'users#show', as: :user_profile

  resources :projects do
    resources :issues do
      resources :comments
    end
  end
end
