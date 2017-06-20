require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do

  # LAZY-LOADED OBJECTS

  let(:authors) { create_list :author, 3 }

  describe "GET index" do

    before(:each) do
      authors
    end

    it "returns HTTP status OK" do
      get :index
      expect(response).to have_http_status :ok
    end
  end
end