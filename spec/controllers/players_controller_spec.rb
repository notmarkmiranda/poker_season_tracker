require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  describe "GET index" do
    it "assigns @players" do
      player = create(:player)
      get :index
      expect(assigns(:players)).to eq([player])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    before do
      @player = create(:player)
    end

    it "assigns @player" do
      get :show, params: { id: @player.id }
      expect(assigns(:player)).to eq(@player)
    end

    it "renders the show template" do
      get :show, params: { id: @player.id }
      expect(response).to render_template(:show)
    end

    it "redirects to 404 on invalid player id" do
      get :show, params: { id: (@player.id + 1) }
      expect(response).to redirect_to(error_404_path)
    end
  end

  describe "GET new" do
    it "assigns @player" do
      get :new
      expect(assigns(:player)).to be_a_new(Player)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    before do
      p = create(:participant)
      g = create(:game)
      @attrs = attributes_for(:player, participant_id: p.id, game_id: g.id)
    end

    context "with valid attributes" do
      it "creates a new player" do
        expect {
          post :create, params: { player: @attrs }
        }.to change(Player, :count).by(1)
      end

      it "redirects to the player" do
        post :create, params: { player: @attrs }
        expect(response).to redirect_to Player.last
      end
    end
  end

  describe "PUT update" do
    before do
      @player = create(:player, finishing_place: nil)
    end

    it "updates finishing place" do
      expect(@player.finishing_place).to be_nil
      put :update, params: { id: @player.id, player: { finishing_place: 4} }
      @player.reload
      expect(@player.finishing_place).to eq(4)
    end
  end
end
