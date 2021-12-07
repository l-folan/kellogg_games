require "rails_helper"

RSpec.describe Game, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:game_category) }

    it { should have_many(:attendees) }

    it { should have_many(:messages) }

    it { should belong_to(:host) }
  end

  describe "InDirect Associations" do
    it { should have_many(:authors) }

    it { should have_many(:players) }
  end

  describe "Validations" do
  end
end
