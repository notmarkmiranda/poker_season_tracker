require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns @players" do
      participant = create(:participant)
      get :index
      expect(assigns(:participants)).to eq([participant])
    end
  end
end