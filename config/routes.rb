Rails.application.routes.draw do
  devise_for :users
  mount ActionCable.server, at: '/cable'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  post 'signup', to: "home#create"
  delete 'logout', to: "home#destroy"

  resources 'movies' do
    resources 'votes', only: [:create, :destroy]
  end
end
