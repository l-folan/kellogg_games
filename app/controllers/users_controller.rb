class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).includes(:comments, :games,
                                                :attendees, :accepted_games, :messages).page(params[:page]).per(10)
  end

  def show
    @attendee = Attendee.new
    @game = Game.new
    @message = Message.new
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
