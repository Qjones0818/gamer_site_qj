class HypedGamesController < ApplicationController
  def index
    @hyped_games = HypedGame.all

    render("hyped_games/index.html.erb")
  end

  def show
    @hyped_game = HypedGame.find(params[:id])

    render("hyped_games/show.html.erb")
  end

  def new
    @hyped_game = HypedGame.new

    render("hyped_games/new.html.erb")
  end

  def create
    @hyped_game = HypedGame.new

    @hyped_game.videogame_id = params[:videogame_id]
    @hyped_game.user_id = params[:user_id]

    save_status = @hyped_game.save

    if save_status == true
      redirect_to("/hyped_games/#{@hyped_game.id}", :notice => "Hyped game created successfully.")
    else
      render("hyped_games/new.html.erb")
    end
  end

  def edit
    @hyped_game = HypedGame.find(params[:id])

    render("hyped_games/edit.html.erb")
  end

  def update
    @hyped_game = HypedGame.find(params[:id])

    @hyped_game.videogame_id = params[:videogame_id]
    @hyped_game.user_id = params[:user_id]

    save_status = @hyped_game.save

    if save_status == true
      redirect_to("/hyped_games/#{@hyped_game.id}", :notice => "Hyped game updated successfully.")
    else
      render("hyped_games/edit.html.erb")
    end
  end

  def destroy
    @hyped_game = HypedGame.find(params[:id])

    @hyped_game.destroy

    if URI(request.referer).path == "/hyped_games/#{@hyped_game.id}"
      redirect_to("/", :notice => "Hyped game deleted.")
    else
      redirect_to(:back, :notice => "Hyped game deleted.")
    end
  end
end
