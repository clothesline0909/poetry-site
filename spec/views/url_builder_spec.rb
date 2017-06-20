require 'rails_helper'

RSpec.describe URLBuilder do

  # LAZY-LOADED OBJECTS

  let(:author) { create :author }
  let(:poem) { create :poem }

  # CALLBACKS

  before(:each) do
    stub_const 'ENV', { 'DOMAIN_NAME' => 'http://www.example.com'}
  end

  # CLASS METHODS

  describe "::url_for_model" do
    context "with Author" do
      it "builds the correct URL" do
        expect(URLBuilder.url_for_model(Author)).to eq "http://www.example.com/authors"
      end
    end
  end

  describe "::url_for_resource" do
    context "with an author" do
      it "builds the correct URL" do
        expect(URLBuilder.url_for_resource(author)).to eq "http://www.example.com/authors/#{author.id}"
      end
    end
  end

end