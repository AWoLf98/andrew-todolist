Rails.application.routes.draw do
  get 'todos/index'


  get '/todos/:todo_id/lists/:id/up', to: 'lists#up'
  get '/todos/:todo_id/lists/:id/up', to: 'lists#down'

  resources :todos do
    resources :lists do
      member do
        patch :complete
        patch :up
        patch :down
      end
    end
  end

  root 'todos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
