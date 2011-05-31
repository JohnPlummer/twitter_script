TwitterScript::Application.routes.draw do
  get "follow_back/index"

  get 'sessions/callback', :to => 'sessions#callback', :as => 'callback'
  resources :sessions
  root :to => 'sessions#new'
end
