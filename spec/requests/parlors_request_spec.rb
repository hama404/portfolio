require 'rails_helper'

RSpec.describe "Parlors", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/parlors/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/parlors/show"
      expect(response).to have_http_status(:success)
    end
  end
end
