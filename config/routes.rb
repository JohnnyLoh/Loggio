Rails.application.routes.draw do
  devise_for :users
  # devise_for :user
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teams, except: [:edit, :update] do
    resources :dashboard, only: [:index, :new, :create] do
    end
  end

  resources :columns, except: [:index, :show] do
    resources :cards, except: [:index, :show] do
    end
  end
end
