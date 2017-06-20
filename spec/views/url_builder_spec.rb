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

  describe "::url_for" do
    context "author" do
      it "builds the correct URL" do
        expect(URLBuilder.url_for(author)).to eq "http://www.example.com/authors/#{author.id}"
      end
    end

    context "poem" do
      it "builds the correct URL" do
        expect(URLBuilder.url_for(poem)).to eq "http://www.example.com/poems/#{poem.id}"
      end
    end
  end

end