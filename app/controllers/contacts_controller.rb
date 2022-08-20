class ContactsController < ApplicationController
  def create
    body = get_body(params)
    res = @easybroker_obj.create_contact(body)
    redirect_to property_url(id: params[:public_id], res:)
  end

  private

  def contact_params
    params.permit(:name, :phone, :email, :message, :source)
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
