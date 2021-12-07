require 'rails_helper'

RSpec.describe "game_categories#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/game_categories/#{game_category.id}"
  end

  describe 'basic destroy' do
    let!(:game_category) { create(:game_category) }

    it 'updates the resource' do
      expect(GameCategoryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { GameCategory.count }.by(-1)
      expect { game_category.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
