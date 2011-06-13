TwitterScript::Application.routes.draw do
  get 'sessions/callback', :to => 'sessions#callback', :as => 'callback'
  get 'oauth/authorize', :to => 'sessions#callback' # this is being requested in cucumber rather than sessions/callback
  match '/signout' => 'sessions#destroy', :as => 'signout'
  resources :sessions

  root :to => 'sessions#new'

  if Rails.env.development?
    match 'vcr/insert' => 'vcr#insert', :via => :post
    match 'vcr/eject' => 'vcr#eject', :via => :post
    match 'vcr' => 'vcr#index'
  end

end
