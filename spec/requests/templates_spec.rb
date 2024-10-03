require 'rails_helper'

RSpec.describe "Templates", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/templates/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/templates/create"
      expect(response).to have_http_status(:success)
    end
  end

end
