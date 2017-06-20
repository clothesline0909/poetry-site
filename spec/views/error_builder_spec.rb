require 'rails_helper'

RSpec.describe ErrorBuilder do

  # LAZY-LOADED OBJECTS

  let(:author) { create :author }

  # CLASS METHODS

  describe "::errors_for" do
    context "with an author" do
      context "with non-unique name and no biography" do
        it "has 2 errors" do
          invalid_author = build :author, name: author.name, biography: nil
          expect(ErrorBuilder.errors_for(invalid_author).length).to be 2
        end

        it "has correct error status" do
          invalid_author = build :author, name: author.name, biography: nil
          expect(ErrorBuilder.errors_for(invalid_author).first[:status]).to eq 400
        end

        it "has correct error detail message" do
          invalid_author = build :author, name: author.name, biography: nil
          expect(ErrorBuilder.errors_for(invalid_author).first[:detail]).to eq "Name '#{author.name}' has already been taken."
        end
      end

      context "with valid attributes" do
        it "has no errors" do
          expect(ErrorBuilder.errors_for(author).length).to be 0
        end
      end
    end
  end

end