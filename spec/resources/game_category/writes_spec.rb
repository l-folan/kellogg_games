require "rails_helper"

RSpec.describe GameCategoryResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "game_categories",
          attributes: {},
        },
      }
    end

    let(:instance) do
      GameCategoryResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { GameCategory.count }.by(1)
    end
  end

  describe "updating" do
    let!(:game_category) { create(:game_category) }

    let(:payload) do
      {
        data: {
          id: game_category.id.to_s,
          type: "game_categories",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      GameCategoryResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { game_category.reload.updated_at }
      # .and change { game_category.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:game_category) { create(:game_category) }

    let(:instance) do
      GameCategoryResource.find(id: game_category.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { GameCategory.count }.by(-1)
    end
  end
end
