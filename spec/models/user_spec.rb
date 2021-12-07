require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:messages) }

    it { should have_many(:games_attending) }

    it { should have_many(:games_hosted) }
  end

  describe "InDirect Associations" do
    it { should have_many(:game_messages) }

    it { should have_many(:games_joined) }
  end

  describe "Validations" do
  end
end
