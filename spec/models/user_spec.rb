require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:attendees) }

    it { should have_many(:games) }

    it { should have_many(:comments) }
  end

  describe "InDirect Associations" do
    it { should have_many(:messages) }

    it { should have_many(:accepted_games) }
  end

  describe "Validations" do
  end
end
