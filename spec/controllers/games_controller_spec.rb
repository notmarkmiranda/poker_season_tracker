require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  before do
    user = User.create(email: "a@b.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  describe "GET index" do
    it "assigns @games" do
      game = create(:game)
      get :index
      expect(assigns(:games)).to eq([game])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    before do
      @game = create(:game)
    end

    it "assigns @game" do
      get :show, params: { id: @game.id }
      expect(assigns(:game)).to eq(@game)
    end

    it "renders the show template" do
      get :show, params: { id: @game.id }
      expect(response).to render_template(:show)
    end

    it "redirects to 404 on invalid game id" do
      get :show, params: { id: (@game.id + 1) }
      expect(response).to redirect_to(error_404_path)
    end
  end

  describe "GET new" do
    it "assigns @game" do
      get :new
      expect(assigns(:game)).to be_a_new(Game)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    before do
      season = create(:season)
      @attrs = attributes_for(:game, season_id: season.id)
    end

    context "with valid attriubtes" do
      it "creates a new game" do
        expect {
          post :create, params: { game: @attrs }
        }.to change(Game, :count).by(1)
      end

      it "redirects to the game" do
        post :create, params: { game: @attrs }
        expect(response).to redirect_to(edit_game_path(Game.last))
      end
    end

    context "with invalid attributes" do
      it "re renders the new template - date" do
        post :create, params: { game: { buy_in: @attrs[:buy_in], season_id: @attrs[:season_id] } }
        expect(response).to render_template(:new)
      end

      it "re renders the new template - buy_in" do
        post :create, params: { game: { date: @attrs[:date], season_id: @attrs[:season_id] } }
        expect(response).to render_template(:new)
      end

      it "re renders the new template - buy_in" do
        post :create, params: { game: { date: @attrs[:date], buy_in: @attrs[:buy_in] } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET edit" do
    before do
      @game = create(:game)
    end

    it "assigns @game" do
      get :edit, params: { id: @game.id }
      expect(assigns(:game)).to eq(@game)
    end

    it "redirects to the edit template" do
      get :edit, params: { id: @game.id }
      expect(response).to render_template(:edit)
    end

    it "redirects to 404 on invalid game id" do
      get :edit, params: { id: (@game.id + 1) }
      expect(response).to redirect_to(error_404_path)
    end
  end

  describe "PUT update" do
    before do
      @game = create(:game)
    end

    context "with valid attributes" do
      it "assigns @game" do
        put :update, params: { id: @game.id, game: attributes_for(:participant) }
        expect(assigns(:game)).to eq(@game)
      end

      it "changes @game's attributes" do
        put :update, params: { id: @game.id, game: attributes_for(:game, date: "2015-12-06") }
        @game.reload
        expect(@game.date).to eq(Date.new(2016, 10, 01))
      end

      it "redirects to the updated game" do
        put :update, params: { id: @game.id, game: attributes_for(:game, date: "2015-12-06") }
        @game.reload
        expect(response).to redirect_to(@game)
      end
    end

    context "with invalid attributes" do
      xit "does not change attributes and rerenders edit - date" do
        put :update, params: { id: @game.id, game: attributes_for(:game, date: nil) }
        @game.reload
        expect(@game.date).to eq(Date.new(2016, 10, 1))
        expect(response).to render_template(:edit)
      end

      xit "does not change attributes - buy in" do
        put :update, params: { id: @game.id, game: attributes_for(:game, buy_in: nil) }
        @game.reload
        expect(@game.buy_in).to eq(1)
        expect(response).to render_template(:edit)
      end

      xit "does not change attributes - season id" do
        old_season = @game.season_id
        put :update, params: { id: @game.id, game: attributes_for(:game, season_id: nil) }
        @game.reload
        expect(@game.season_id).to eq(old_season)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE destroy" do
    before do
      @game = create(:game)
    end

    it "removes @game" do
      expect {
        delete :destroy, params: { id: @game.id }
      }.to change(Game, :count).by(-1)
    end

    it "redirects to game index" do
      delete :destroy, params: { id: @game.id }
      expect(response).to redirect_to games_path
    end
  end

  describe "finishing a game recalculates score on update" do
    before do
      @game = create(:game)

      @player1 = create(:player, game_id: @game.id, finishing_place: 1)
      @player2 = create(:player, game_id: @game.id, finishing_place: 2)
    end

    it "calculates the score on update" do
      expect(@player1.score).to be_nil
      expect(@player2.score).to be_nil

      patch :update, params: { id: @game.id, game: attributes_for(:game, completed: true) }

      expect(@player1.reload.score).to eq(0.7)
      expect(@player2.reload.score).to eq(0.47)
    end
  end
end
