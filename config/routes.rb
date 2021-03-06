Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: 'users/sessions' }

  get 'sessions/new'
  get 'users/new'
  get 'earned_badges/index'

  root 'tests#index'

  resources :badges, only: :index

  resources :contacts, only: %i[new create]

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :badges

    resources :gists, only: :index
  end
end
