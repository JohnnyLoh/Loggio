Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  devise_for :users
  # devise_for :user
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teams, except: [:edit, :update] do
  end
  # resources :users, only: [:show, :edit, :update]

  resources :columns, except: [:index, :show] do
    resources :cards, except: [:index, :show] do
    end
  end
  get ':column_id/add_team', to: 'columns#addTeam'
  get 'filtered_teams', to: 'filters#index'

end
