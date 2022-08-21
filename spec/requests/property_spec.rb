require "rails_helper"
require_relative "../../app/poros/property"
require_relative "../../app/services/easy_broker_service"

RSpec.describe "Property", type: :request do
  describe "instantiation" do
    it "returns correctly attributes with method list properties", :vcr do
      res = EasyBrokerService.new.list_properties(1).parsed_response["content"][0]
      property = Property.new(res)
      expect(property.public_id).to eq("EB-C0156")
      expect(property.title).to eq("Casa con uso de suelo prueba")
      expect(property.location).to eq("La Punta, Cosío, Aguascalientes")
      expect(property.property_type).to eq("Casa con uso de suelo")
    end

    it "returns correctly attributes with method show property", :vcr do
      public_id = "EB-C0156"
      res = EasyBrokerService.new.show_property(public_id).parsed_response
      property = Property.new(res)
      expect(property.public_id).to eq(public_id)
      expect(property.title).to eq("Casa con uso de suelo prueba")
      expect(property.description).to eq("Esto es una prueba más.")
      expect(property.location["name"]).to eq("La Punta, Cosío, Aguascalientes")
      expect(property.property_type).to eq("Casa con uso de suelo")
    end
  end
end
