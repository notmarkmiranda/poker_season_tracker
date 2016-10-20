require 'rails_helper'

RSpec.describe SeasonsController, type: :controller do
  describe "GET index" do
    it "assigns @seasons" do
      season = create(:season)
      get :index
      expect(assigns(:seasons)).to eq([season])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    before do
      @season = create(:season)
    end

    it "assigns @season" do
      get :show, params: { id: @season.id }
      expect(assigns(:season)).to eq(@season)
    end

    it "renders the show template" do
      get :show, params: { id: @season.id }
      expect(response).to render_template(:show)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new season - true" do
        expect {
          post :create, params: { season: attributes_for(:season) }
        }.to change(Season, :count).by(1)
      end

      it "creates a new season - false" do
        expect {
          post :create, params: { season: attributes_for(:season, active: false) }
        }.to change(Season, :count).by(1)
      end

      it "creates a new season - empty" do
        expect {
          post :create, params: { season: { active: nil } }
        }.to change(Season, :count).by(1)
      end

      it "redirects to the individual season" do
        post :create, params: { season: attributes_for(:season) }
        expect(response).to redirect_to Season.last
      end
    end
  end
end
