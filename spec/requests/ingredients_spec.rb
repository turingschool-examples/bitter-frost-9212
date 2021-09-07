require 'rails_helper'

RSpec.describe "Ingredients", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ingredients/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/ingredients/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/ingredients/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/ingredients/create"
      expect(response).to have_http_status(:success)
    end
  end

end
