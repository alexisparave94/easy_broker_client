class EasyBrokerService
  include HTTParty
  base_uri "https://api.stagingeb.com/v1"

  def initialize
    @options = {
      headers: {
        "X-Authorization": "l7u502p8v46ba3ppgvj5y2aad50lb9"
      }
    }
  end

  def list_properties(page)
    self.class.get("/properties?page=#{page}&limit=15&search%5Bstatuses%5D%5B%5D=published", @options)
  end

  def show_property(public_id)
    self.class.get("/properties/#{public_id}", @options)
  end

  def create_contact(data)
    @options[:headers]["Content-type"] = "application/json"
    @options[:body] = data.to_json
    self.class.post("/contact_requests", @options)
  end
end
