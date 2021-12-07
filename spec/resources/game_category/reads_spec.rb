require "rails_helper"

RSpec.describe GameCategoryResource, type: :resource do
  describe "serialization" do
    let!(:game_category) { create(:game_category) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(game_category.id)
      expect(data.jsonapi_type).to eq("game_categories")
    end
  end

  describe "filtering" do
    let!(:game_category1) { create(:game_category) }
    let!(:game_category2) { create(:game_category) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: game_category2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([game_category2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:game_category1) { create(:game_category) }
      let!(:game_category2) { create(:game_category) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      game_category1.id,
                                      game_category2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      game_category2.id,
                                      game_category1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
