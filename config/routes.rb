Rails.application.routes.draw do
  get 'emails' => 'emails#index'
  post 'emails/standard'
  post 'emails/delayed'

  resources :letters, only: [ :index ] do
    member do
      patch :upvote # /letters/4/upvote
      patch :downvote # /letters/4/downvote
    end
  end
  root 'letters#index'
end
