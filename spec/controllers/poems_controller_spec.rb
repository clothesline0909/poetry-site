require 'rails_helper'

RSpec.describe PoemsController, type: :controller do
  render_views

  # LAZY-LOADED OBJECTS

  let(:poems) { create_list :poem, 3 }
  let(:poem) { create :poem }
  let(:author) { create :author }

  # CALLBACKS

  before(:each) do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end

  describe "GET index" do

    before(:each) do
      poems
    end

    it "returns HTTP status OK" do
      get :index
      expect(response).to have_http_status :ok
    end

    it "renders index template" do
      get :index
      expect(response).to render_template 'poems/index'
    end

    it "returns 3 poems" do
      get :index
      expect(JSON.parse(response.body, symbolize_names: true)[:data].length).to be 3
    end

    it "returns poem attributes" do
      get :index
      expect(JSON.parse(response.body, symbolize_names: true)[:data].first[:attributes][:title]).to eq poems.first.title
    end

    it "doesn't return poem relationships" do
      get :index
      expect(JSON.parse(response.body, symbolize_names: true)[:data].first[:relationships]).to be nil
    end
  end

  describe "GET show" do

    context "with non-existant record" do
      it "returns HTTP status not found" do
        get :show, params: { id: 0 }
        expect(response).to have_http_status :not_found
      end
    end

    context "with existing record" do
      it "returns HTTP status OK" do
        get :show, params: { id: poem.id }
        expect(response).to have_http_status :ok
      end

      it "renders show template" do
        get :show, params: { id: poem.id }
        expect(response).to render_template 'poems/show'
      end

      it "returns poem attributes" do
        get :show, params: { id: poem.id }
        expect(JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:title]).to eq poem.title
      end

      it "returns poem relationships" do
        get :show, params: { id: poem.id }
        expect(JSON.parse(response.body, symbolize_names: true)[:data][:relationships]).not_to be nil
      end
    end
  end

  describe "POST create" do

    let(:poem_params) do
      {
        data: {
          type: 'poems',
          attributes: {
            title: 'Title',
            year: 'Year',
            text: 'Text'
          },
          relationships: {
            author: {
              data: {
                type: 'authors',
                id: author.id
              }
            }
          }
        }
      }
    end

    it "returns HTTP status OK" do
      post :create, params: poem_params
      expect(response).to have_http_status :created
    end

    it "renders show template" do
      post :create, params: poem_params
      expect(response).to render_template 'poems/show'
    end

    it "returns poem attributes" do
      post :create, params: poem_params
      expect(JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:title]).to eq 'Title'
    end

    it "returns poem relationships" do
      post :create, params: poem_params
      expect(JSON.parse(response.body, symbolize_names: true)[:data][:relationships]).not_to be nil
    end
  end

  describe "PATCH update" do
    let(:poem_params) do
      {
        id: poem.id,
        data: {
          type: "poems",
          id: poem.id,
          attributes: {
            title: 'Title',
            year: 'Year',
            text: 'Text'
          },
          relationships: {
            author: {
              data: {
                type: 'authors',
                id: author.id
              }
            }
          }
        }
      }
    end

    it "returns HTTP status OK" do
      patch :update, params: poem_params
      expect(response).to have_http_status :ok
    end

    it "renders show template" do
      post :create, params: poem_params
      expect(response).to render_template 'poems/show'
    end

    it "returns poem attributes" do
      post :create, params: poem_params
      expect(JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:title]).to eq 'Title'
    end

    it "returns poem relationships" do
      post :create, params: poem_params
      expect(JSON.parse(response.body, symbolize_names: true)[:data][:relationships]).not_to be nil
    end
  end
end