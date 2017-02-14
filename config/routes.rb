Rails.application.routes.draw do
  root 'questions#index'
  resources :questions, :only => [] do
    resources :answers
    end
    resources :users, :only => [] do
      resources :questions
    end
  devise_for :users
end
