Rails.application.routes.draw do
  devise_for :owners, controllers: {
    sessions: 'owners/sessions',
    passwords: 'owners/passwords',
    registrations: 'owners/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root 'spaces#index'
  resources :users, only: [:show]
  resources :owners, only: [:show]
  resources :spaces, only: [:index, :new, :create, :show] do
    resources :reservations, only: [:new, :create, :show, :destroy] do
      resources :events, only: [:new, :index]
    end
  end
end
