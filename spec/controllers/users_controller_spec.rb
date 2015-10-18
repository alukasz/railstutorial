require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with invalid data" do
      it "does not create a new user" do
        expect do
          post :create, user: attributes_for(:invalid_user)
        end.not_to change(User, :count)
      end
    end

    context "with valid data" do
      it "creates a new user" do
        expect do
          post :create, user: attributes_for(:user)
        end.to change(User, :count).by 1
      end
    end
  end
end
