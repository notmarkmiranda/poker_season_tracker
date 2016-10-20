require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do
  describe "GET index" do
    it "assigns @participants" do
      participant = create(:participant)
      get :index
      expect(assigns(:participants)).to eq([participant])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    before do
      @participant = create(:participant)
    end

    it "assigns @participant" do
      get :show, params: { id: @participant.id }
      expect(assigns(:participant)).to eq(@participant)
    end

    it "renders the show template" do
      get :show, params: { id: @participant.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET new" do
    it "assigns @participant" do
      get :new
      expect(assigns(:participant)).to be_a_new(Participant)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    before do
      @attrs = attributes_for(:participant)
    end

    context "with valid attributes" do
      it "creates a new participant" do
        expect {
          post :create, params: { participant: @attrs }
        }.to change(Participant, :count).by(1)
      end

      it "redirects to the participant" do
        post :create, params: { participant: @attrs }
        expect(response).to redirect_to(Participant.last)
      end
    end

    context "with invalid attributes" do
      it "redirects to new template without first name" do
        post :create, params: { participant: { last_name: "doe" }}
        expect(response).to render_template(:new)
      end

      it "redirects to new template without last name" do
        post :create, params: { participant: { first_name: "john" }}
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET edit" do
    before do
      @participant = create(:participant)
    end

    it "assigns @participant" do
      get :edit, params: { id: @participant.id }
      expect(assigns(:participant)).to eq(@participant)
    end

    it "renders the edit template" do
      get :edit, params: { id: @participant.id }
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT update" do
    before do
      @participant = create(:participant)
    end

    context "with valid attributes" do
      it "assigns @participant" do
        put :update, params: { id: @participant.id, participant: attributes_for(:participant) }
        expect(assigns(:participant)).to eq(@participant)
      end

      it "changes @patricipant's attributes" do
        put :update, params: { id: @participant.id, participant: attributes_for(:participant, first_name: "Mark", last_name: "Miranda") }
        @participant.reload
        expect(@participant.first_name).to eq("Mark")
        expect(@participant.last_name).to eq("Miranda")
      end

      it "redirects to the updated patricipant" do
        put :update, params: { id: @participant.id, participant: attributes_for(:participant, first_name: "Mark", last_name: "Miranda") }
        expect(response).to redirect_to(@participant)
      end
    end

    context "with invalid attributes" do
      it "assigns @participant" do
        put :update, params: { id: @participant.id, participant: { first_name: "", last_name: @participant.last_name} }
        expect(assigns(:participant)).to eq(@participant)
      end

      it "does not change attributes - first name" do
        put :update, params: { id: @participant.id, participant: { first_name: nil, last_name: "Miranda" } }
        @participant.reload
        expect(@participant.first_name).to eq("John")
        expect(@participant.last_name).not_to eq("Miranda")
      end

      it "does not change attributes - last name" do
        put :update, params: { id: @participant.id, participant: { first_name: "Mark", last_name: nil } }
        @participant.reload
        expect(@participant.first_name).not_to eq("Mark")
        expect(@participant.last_name).to eq("Doe")
      end

      it "renders the edit template" do
        put :update, params: { id: @participant.id, participant: { first_name: "Mark", last_name: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE destroy" do
    before do
      @participant = create(:participant)
    end

    it "removes @participant" do
      expect{
        delete :destroy, params: { id: @participant.id }
      }.to change(Participant, :count).by(-1)
    end

    it "redirects to participant index" do
      delete :destroy, params: { id: @participant.id }
      expect(response).to redirect_to participants_path
    end
  end

end
