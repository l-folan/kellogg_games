require 'rails_helper'

RSpec.describe Message, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:game) }

    it { should belong_to(:author) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
