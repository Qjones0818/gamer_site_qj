class VideogamesController < ApplicationController
  def index
    @videogames = Videogame.all

    render("videogames/index.html.erb")
  end

  def show
    @videogame = Videogame.find(params[:id])
    @hyped_game = HypedGame.new

    render("videogames/show.html.erb")
  end

  def new
    @videogame = Videogame.new

    render("videogames/new.html.erb")
  end

  def create
    @videogame = Videogame.new

    @videogame.title = params[:title]
    @videogame.description = params[:description]
    @videogame.image_url = params[:image_url]

    save_status = @videogame.save

    if save_status == true
      redirect_to("/videogames/#{@videogame.id}", :notice => "Videogame created successfully.")
    else
      render("videogames/new.html.erb")
    end
  end

  def edit
    @videogame = Videogame.find(params[:id])

    render("videogames/edit.html.erb")
  end

  def update
    @videogame = Videogame.find(params[:id])

    @videogame.title = params[:title]
    @videogame.description = params[:description]
    @videogame.image_url = params[:image_url]

    save_status = @videogame.save

    if save_status == true
      redirect_to("/videogames/#{@videogame.id}", :notice => "Videogame updated successfully.")
    else
      render("videogames/edit.html.erb")
    end
  end

  def destroy
    @videogame = Videogame.find(params[:id])

    @videogame.destroy

    if URI(request.referer).path == "/videogames/#{@videogame.id}"
      redirect_to("/", :notice => "Videogame deleted.")
    else
      redirect_to(:back, :notice => "Videogame deleted.")
    end
  end
end
