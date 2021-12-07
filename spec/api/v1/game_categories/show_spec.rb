require 'rails_helper'

RSpec.describe "game_categories#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/game_categories/#{game_category.id}", params: params
  end

  describe 'basic fetch' do
    let!(:game_category) { create(:game_category) }

    it 'works' do
      expect(GameCategoryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('game_categories')
      expect(d.id).to eq(game_category.id)
    end
  end
end
