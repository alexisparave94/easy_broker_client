require "rails_helper"
require_relative "../../app/poros/contact"
require_relative "../../app/services/easy_broker_service"

RSpec.describe "Contact", type: :request do
  describe "instantiation" do
    it "returns correctly attributes" do
      data = {
        public_id: "EB-C0156",
        name: "Alexis",
        phone: "9865321478",
        email: "alexis@mail.com",
        message: "I'm interested contact me",
        source: "mydomain.com"
      }
      contact = Contact.new(data)
      expect(contact.property_id).to eq("EB-C0156")
      expect(contact.name).to eq("Alexis")
      expect(contact.phone).to eq("9865321478")
      expect(contact.email).to eq("alexis@mail.com")
      expect(contact.message).to eq("I'm interested contact me")
      expect(contact.source).to eq("mydomain.com")
    end
  end
end
