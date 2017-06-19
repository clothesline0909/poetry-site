require 'rails_helper'

RSpec.describe Author, type: :model do

  let(:author) { create :author }

  context "with existing name" do
    it "is invalid" do
      other_author = build :author, name: author.name
      expect(other_author.valid?).to be false
    end
  end
end