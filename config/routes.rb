Rails.application.routes.draw do
  get 'sessions/new'

  namespace :admin do
    resources :users
  end

  namespace :admin do
    resources :user_responses
  end

  namespace :admin do
    resources :question_instances
  end

  namespace :admin do
    resources :choices
  end

  namespace :admin do
    resources :questions
  end

  namespace :admin do
    resources :difficulties
  end

  resources :widgets

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'

get "logout" => "sessions#destroy", :as => "logout"
get "login" => "sessions#new", :as => "login"
get "signup" => "admin/users#new", :as => "signup"
resources :sessions

end