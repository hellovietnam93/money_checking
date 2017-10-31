Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions"}

  root "pages#show", page: "home"

  get "/pages/*page" => "pages#show"

  resources :categories, only: %i(index new create edit update destroy)
  resources :incomes, only: %i(index new create edit update destroy)
end
