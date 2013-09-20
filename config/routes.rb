TicTacToeRails::Application.routes.draw do
  root :to => 'boards#new'

  resources :boards
end
