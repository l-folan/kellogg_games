class GameCategoriesController < ApplicationController
  before_action :set_game_category, only: %i[show edit update destroy]

  def index
    @q = GameCategory.ransack(params[:q])
    @game_categories = @q.result(distinct: true).includes(:games).page(params[:page]).per(10)
  end

  def show
    @game = Game.new
  end

  def new
    @game_category = GameCategory.new
  end

  def edit; end

  def create
    @game_category = GameCategory.new(game_category_params)

    if @game_category.save
      redirect_to @game_category,
                  notice: "Game category was successfully created."
    else
      render :new
    end
  end

  def update
    if @game_category.update(game_category_params)
      redirect_to @game_category,
                  notice: "Game category was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @game_category.destroy
    redirect_to game_categories_url,
                notice: "Game category was successfully destroyed."
  end

  private

  def set_game_category
    @game_category = GameCategory.find(params[:id])
  end

  def game_category_params
    params.require(:game_category).permit(:name)
  end
end
