require_relative "../poros/property"

class PropertiesController < ApplicationController
  def index
    @page = params[:page].to_i || 1
    res = @easybroker_obj.list_properties(@page)
    @properties = res["content"].map { |prop| Property.new(prop) }
    @pages_number ||= pages_number
  end

  def show
    @page = params[:page]
    @res = {}
    @res = JSON.parse(params[:res], symbolize_names: true) if params[:res]
    public_id = params[:id]
    @property = Property.new(@easybroker_obj.show_property(public_id))
  end

  private

  def pages_number
    res = @easybroker_obj.list_properties("1")
    @total_properties = res["pagination"]["total"]
    properties_per_page = res["pagination"]["limit"]
    (@total_properties * 1.0 / properties_per_page).ceil
  end
end
