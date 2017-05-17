Rails.application.routes.draw do
  resources :tasks do
    resources :subtasks, only: [:new, :create, :edit, :update, :destroy]
  end
  post "/tasks/:id/subtasks/new" => "subtasks#create"
  root "tasks#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
