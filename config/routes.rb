Rails.application.routes.draw do

  # USERS routes
  post '/sign_up'           => 'users#create',        as: :users
  get  '/sign_up'           => 'users#new',           as: :new_user
  get  '/confirm_email/:id' => 'users#confirm_email', as: :confirm_email

  # SESSIONS routes
  get    'sign_in'  => 'sessions#new',     as: :session
  post   'sign_in'  => 'sessions#create',  as: :sessions
  delete 'sign_out' => 'sessions#destroy', as: :sign_out

  root 'home#index'

end
