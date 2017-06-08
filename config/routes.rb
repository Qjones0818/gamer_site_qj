Rails.application.routes.draw do

  resources :ratings, only: :update
  # Routes for the Hyped_game resource:
  # CREATE
  get "/hyped_games/new", :controller => "hyped_games", :action => "new"
  post "/hype", :controller => "videogames", :action => "hype"

  # READ
  get "/hyped_games", :controller => "hyped_games", :action => "index"
  get "/hyped_games/:id", :controller => "hyped_games", :action => "show"

  # UPDATE
  get "/hyped_games/:id/edit", :controller => "hyped_games", :action => "edit"
  post "/update_hyped_game/:id", :controller => "hyped_games", :action => "update"

  # DELETE
  get "/delete_hyped_game/:id", :controller => "hyped_games", :action => "destroy"
  #------------------------------

  # Routes for the Videogame resource:
  # CREATE
  get "/videogames/new", :controller => "videogames", :action => "new"
  post "/create_videogame", :controller => "videogames", :action => "create"

  # READ
  get "/videogames", :controller => "videogames", :action => "index"
  get "/videogames/:id", :controller => "videogames", :action => "show"

  # UPDATE
  get "/videogames/:id/edit", :controller => "videogames", :action => "edit"
  post "/update_videogame/:id", :controller => "videogames", :action => "update"

  # DELETE
  get "/delete_videogame/:id", :controller => "videogames", :action => "destroy"
  #------------------------------

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'videogames#index'
end
