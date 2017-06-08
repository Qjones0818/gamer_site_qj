class VideogamesController < ApplicationController
  def index
    redirect_to 'users/edit' unless current_user
    @videogames = Videogame.all.sort_by{|v| v.ratings.size }

    render("videogames/index.html.erb")
  end

  def hype
    Hype.find_or_create_by(videogame_id: params[:videogame_id], user_id: current_user.id)
    redirect_to :back
  end

  def show
    @videogame = Videogame.find(params[:id])
    @myrating = Rating.find_or_create_by(videogame_id: params[:id], user_id: current_user.id)

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
