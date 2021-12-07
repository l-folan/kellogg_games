class Api::V1::GameCategoriesController < Api::V1::GraphitiController
  def index
    game_categories = GameCategoryResource.all(params)
    respond_with(game_categories)
  end

  def show
    game_category = GameCategoryResource.find(params)
    respond_with(game_category)
  end

  def create
    game_category = GameCategoryResource.build(params)

    if game_category.save
      render jsonapi: game_category, status: 201
    else
      render jsonapi_errors: game_category
    end
  end

  def update
    game_category = GameCategoryResource.find(params)

    if game_category.update_attributes
      render jsonapi: game_category
    else
      render jsonapi_errors: game_category
    end
  end

  def destroy
    game_category = GameCategoryResource.find(params)

    if game_category.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: game_category
    end
  end
end
