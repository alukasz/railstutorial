require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  subject { response }

  describe "GET #home" do
    it "returns http success" do
      get :home
      is_expected.to have_http_status(:success)
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      is_expected.to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      is_expected.to have_http_status(:success)
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      is_expected.to have_http_status(:success)
    end
  end
end
