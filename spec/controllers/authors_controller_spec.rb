require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  render_views

  # LAZY-LOADED OBJECTS

  let(:authors) { create_list :author, 3 }

  # CALLBACKS

  before(:each) do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end

  describe "GET index" do

    before(:each) do
      authors
    end

    it "returns HTTP status OK" do
      get :index
      expect(response).to have_http_status :ok
    end

    it "renders index template" do
      get :index
      expect(response).to render_template 'authors/index'
    end

    it "returns 3 authors" do
      get :index
      expect(JSON.parse(response.body, symbolize_names: true)[:data].length).to be 3
    end

    it "returns author attributes" do
      get :index
      expect(JSON.parse(response.body, symbolize_names: true)[:data].first[:attributes][:name]).to eq authors.first.name
    end

    it "doesn't return author relationships" do
      get :index
      expect(JSON.parse(response.body, symbolize_names: true)[:data].first[:relationships]).to be nil
    end
  end
end