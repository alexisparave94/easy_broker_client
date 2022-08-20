require "rails_helper"
require_relative "../../app/services/easy_broker_service"
require "request_helper"

RSpec.describe EasyBrokerService, type: :request do
  describe "list_properties" do
    let(:response) { EasyBrokerService.new.list_properties(1) }
    it "returns correctly data", :vcr do
      expect(response.parsed_response).to be_kind_of(Hash)
      expect(response.parsed_response).to have_key("pagination")
      expect(response.parsed_response).to have_key("content")
      expect(response.parsed_response["content"]).to be_kind_of(Array)
    end
  end

  describe "show_property" do
    public_id = "EB-C0156"
    let(:response) { EasyBrokerService.new.show_property("EB-C0156") }
    it "returns correctly data", :vcr do
      expect(response.parsed_response).to be_kind_of(Hash)
      expect(response.parsed_response).to have_key("public_id")
      expect(response.parsed_response).to have_key("title")
      expect(response.parsed_response["public_id"]).to eq(public_id)
    end
  end

  describe "create_contact" do
    it "returns status successful", :vcr do
      data = {
        property_id: "EB-C0156",
        name: "Alexis",
        phone: "9865321478",
        email: "alexis@mail.com",
        message: "I'm interested contact me",
        source: "mydomain.com"
      }
      response1 = EasyBrokerService.new.create_contact(data)
      expect(response1).to be_success
      expect(response1.parsed_response).to have_key("status")
    end

    it "returns error property not be found", :vcr do
      data = {
        property_id: "XXXXXXX",
        name: "Alexis",
        phone: "9865321478",
        email: "alexis@mail.com",
        message: "I'm interested contact me",
        source: "mydomain.com"
      }
      response2 = EasyBrokerService.new.create_contact(data)
      expect(response2.parsed_response).to have_key("error")
      expect(response2.parsed_response["error"]).to eq("No se encontró la propiedad especificada.")
    end

    it "returns error must specify a name, email or phone number", :vcr do
      data = {
        property_id: "EB-C0156",
        message: "I'm interested contact me",
        source: "mydomain.com"
      }
      response3 = EasyBrokerService.new.create_contact(data)
      expect(response3.parsed_response).to have_key("error")
      expect(response3.parsed_response["error"]).to eq("Debes especificar un nombre, correo o número telefónico.")
    end
  end
end
