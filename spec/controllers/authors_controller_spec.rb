require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  render_views

  # LAZY-LOADED OBJECTS

  let(:authors) { create_list :author, 3 }
  let(:author) { create :author }

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

  describe "GET show" do

    it "returns HTTP status OK" do
      get :show, params: { id: author.id }
      expect(response).to have_http_status :ok
    end

    it "renders show template" do
      get :show, params: { id: author.id }
      expect(response).to render_template 'authors/show'
    end

    it "returns author attributes" do
      get :show, params: { id: author.id }
      expect(JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:name]).to eq author.name
    end

    it "returns author relationships" do
      get :show, params: { id: author.id }
      expect(JSON.parse(response.body, symbolize_names: true)[:data][:relationships]).not_to be nil
    end
  end

  describe "POST create" do

    let(:author_params) do
      {
        data: {
          type: "authors",
          attributes: {
            name: 'Name',
            biography: 'Biography'
          }
        }
      }
    end

    it "returns HTTP status OK" do
      post :create, params: author_params
      expect(response).to have_http_status :created
    end

    it "renders show template" do
      post :create, params: author_params
      expect(response).to render_template 'authors/show'
    end

    it "returns author attributes" do
      post :create, params: author_params
      expect(JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:name]).to eq 'Name'
    end

    it "returns author relationships" do
      post :create, params: author_params
      expect(JSON.parse(response.body, symbolize_names: true)[:data][:relationships]).not_to be nil
    end
  end

  describe "PATCH update" do
    let(:author_params) do
      {
        id: author.id,
        data: {
          type: "authors",
          id: author.id,
          attributes: {
            name: 'Name',
            biography: 'Biography'
          }
        }
      }
    end

    it "returns HTTP status OK" do
      patch :update, params: author_params
      expect(response).to have_http_status :ok
    end

    it "renders show template" do
      post :create, params: author_params
      expect(response).to render_template 'authors/show'
    end

    it "returns author attributes" do
      post :create, params: author_params
      expect(JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:name]).to eq 'Name'
    end

    it "returns author relationships" do
      post :create, params: author_params
      expect(JSON.parse(response.body, symbolize_names: true)[:data][:relationships]).not_to be nil
    end
  end
end