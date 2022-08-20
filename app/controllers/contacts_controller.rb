require_relative "../poros/contact"

class ContactsController < ApplicationController
  def create
    body = get_body(params)
    res = @easybroker_obj.create_contact(body)
    redirect_to property_url(id: params[:public_id], res:)
  end

  private

  def contact_params
    params.permit(:public_id, :name, :phone, :email, :message, :source)
  end

  def get_body(params)
    contact = Contact.new(params)
    {
      property_id: contact.property_id,
      name: contact.name,
      phone: contact.phone,
      email: contact.email,
      message: contact.message,
      source: contact.source
    }
  end
end
