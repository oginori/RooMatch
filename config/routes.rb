Rails.application.routes.draw do
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
end