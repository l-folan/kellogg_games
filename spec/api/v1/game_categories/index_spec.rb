require 'rails_helper'

RSpec.describe "game_categories#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/game_categories", params: params
  end

  describe 'basic fetch' do
    let!(:game_category1) { create(:game_category) }
    let!(:game_category2) { create(:game_category) }

    it 'works' do
      expect(GameCategoryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['game_categories'])
      expect(d.map(&:id)).to match_array([game_category1.id, game_category2.id])
    end
  end
end
