class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]

  # GET /attendees
  def index
    @attendees = Attendee.all
  end

  # GET /attendees/1
  def show
  end

  # GET /attendees/new
  def new
    @attendee = Attendee.new
  end

  # GET /attendees/1/edit
  def edit
  end

  # POST /attendees
  def create
    @attendee = Attendee.new(attendee_params)

    if @attendee.save
      redirect_to @attendee, notice: 'Attendee was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /attendees/1
  def update
    if @attendee.update(attendee_params)
      redirect_to @attendee, notice: 'Attendee was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /attendees/1
  def destroy
    @attendee.destroy
    message = "Attendee was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to attendees_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attendee_params
      params.require(:attendee).permit(:game_id, :attendance_status, :waitlist_status, :player_id)
    end
end
