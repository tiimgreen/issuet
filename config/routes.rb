Issuet::Application.routes.draw do
  root 'dashboard#index'

  devise_for :users

  resources :projects
end
