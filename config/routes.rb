Issuet::Application.routes.draw do
  get "dashboard/index"
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
