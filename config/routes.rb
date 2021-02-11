Rails.application.routes.draw do
  root to: 'tops#index'

  devise_for :residents, controllers: {
    sessions: 'residents/sessions',
    passwords: 'residents/passwords',
    registrations: 'residents/registrations'
  }
  
  devise_for :coordinators, controllers: {
    sessions: 'coordinators/sessions',
    passwords: 'coordinators/passwords',
    registrations: 'coordinators/registrations'
  }
  
  resources :coordinators
  resources :requests
  resources :interiors
  resources :suggestions, only: [:new, :create, :edit, :update, :show]
  resources :contracts, only: [:index, :create, :edit, :update, :destroy]
  resources :tops, only: [:index, :edit, :update]
  resources :favorites, only: [:index, :create, :destroy]
  resources :msg_tops, only: [:index]
  resources :residents
  resources :requests
  resources :rooms, only: [:create, :show] do
    resources :messages, only: [:create]
  end

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end