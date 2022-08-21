require "rails_helper"

RSpec.describe "Contacts", type: :request do
  describe "create path" do
    it "respond with http success status code", :vcr do
      post "/contact", params: {
        public_id: "EB-C0156",
        name: "Alexis",
        phone: "9865321478",
        email: "alexis@mail.com",
        message: "I'm interested contact me",
        source: "mydomain.com"
      }
      expect(response).to have_http_status(:found)
    end
  end
end
