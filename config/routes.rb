Rails.application.routes.draw do

  get 'rooms/show'
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

  resources :residents
  resources :coordinators
  resources :requests
  resources :interiors
  resources :suggestions, only: [:new, :create, :edit, :update, :show]
  resources :contracts, only: [:index, :create, :edit, :update]
  resources :tops, only: [:index, :edit, :update]
  resources :favorites, only: [:index, :create, :destroy]
  resources :rooms, only: [:show, :create] do
    resources :messages, only: [:create]
  end

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end