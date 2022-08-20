class Contact
  attr_reader :property_id,
              :name,
              :phone,
              :email,
              :message,
              :source

  def initialize(data)
    @property_id = data[:public_id]
    @name = data[:name]
    @phone = data[:phone]
    @email = data[:email]
    @message = data[:message]
    @source = "mydomain.com"
  end
end
