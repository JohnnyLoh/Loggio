Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  devise_for :users

  root to: 'pages#home'

  resources :teams, except: [:edit, :update] do
  end

  resources :columns, except: [:index, :show] do
    resources :cards, except: [:index, :show] do
    end
  end
  get ':column_id/add_team', to: 'columns#addTeam'
  get 'filtered_teams', to: 'filters#index'

end
