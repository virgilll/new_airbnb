Rails.application.routes.draw do
  devise_for :installs
  devise_for :users
  root to: 'pages#home'
  get 'miami_beach', to: 'flats#miami_beach'
  get 'coral_gables', to: 'flats#coral_gables'
  get 'brickell', to: 'flats#brickell'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flats do
    resources :bookings, only: %i[new, create]
  end
  resources :users, only: :show
  resources :booking, only: :destroy do
    member do
      patch :change_status
    end
  end
end
