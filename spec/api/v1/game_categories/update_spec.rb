require "rails_helper"

RSpec.describe "game_categories#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/game_categories/#{game_category.id}", payload
  end

  describe "basic update" do
    let!(:game_category) { create(:game_category) }

    let(:payload) do
      {
        data: {
          id: game_category.id.to_s,
          type: "game_categories",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(GameCategoryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { game_category.reload.attributes }
    end
  end
end
