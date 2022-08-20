class ContactsController < ApplicationController
  before_action :initial_config

  def create
    body = get_body(params)
    @options[:body] = body.to_json
    res = HTTParty.post("#{@base_url}/contact_requests", @options)
    redirect_to property_url(id: params[:public_id], res:)
  end

  private

  def contact_params
    params.permit(:name, :phone, :email, :message, :source)
  end

  def initial_config
    @base_url = "https://api.stagingeb.com/v1"
    @options = {
      headers: {
        "X-Authorization": "l7u502p8v46ba3ppgvj5y2aad50lb9",
        "Content-type": "application/json"
      }
    }
  end

  def get_body(params)
    {
      property_id: params[:public_id],
      name: params[:name],
      phone: params[:phone],
      email: params[:email],
      message: params[:message],
      source: "mydomain.com"
    }
  end
end
