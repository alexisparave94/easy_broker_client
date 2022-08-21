require "rails_helper"

RSpec.describe "Properties", type: :request do
  describe "index path" do
    it "respond with http success status code", :vcr do
      get "/properties"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "show path" do
    it "respond with http success status code", :vcr do
      get "/properties/EB-C0156"
      expect(response).to have_http_status(:ok)
    end
  end
end
