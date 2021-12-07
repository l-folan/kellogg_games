class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]

  # GET /games
  def index
    @q = Game.ransack(params[:q])
    @games = @q.result(distinct: true).includes(:host, :comments,
                                                :attendees, :game_category, :players, :authors).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@games.where.not(loction_latitude: nil)) do |game, marker|
      marker.lat game.loction_latitude
      marker.lng game.loction_longitude
      marker.infowindow "<h5><a href='/games/#{game.id}'>#{game.host_id}</a></h5><small>#{game.loction_formatted_address}</small>"
    end
  end

  # GET /games/1
  def show
    @attendee = Attendee.new
    @message = Message.new
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit; end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      message = "Game was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @game, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      redirect_to @game, notice: "Game was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    message = "Game was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to games_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def game_params
    params.require(:game).permit(:host_id, :description, :date, :time,
                                 :max_attendees, :game_category_id, :loction)
  end
end
