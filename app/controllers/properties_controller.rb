class PropertiesController < ApplicationController
  before_action :initial_config

  def index
    @page = params[:page].to_i || 1
    res = HTTParty.get("#{@base_url}/properties?page=#{@page}&limit=15&search%5Bstatuses%5D%5B%5D=published", @options)
    @properties = res["content"]
    @pages_number ||= pages_number
  end

  def show
    @res = {}
    @res = JSON.parse(params[:res], symbolize_names: true) if params[:res]
    public_id = params[:id]
    @property = HTTParty.get("#{@base_url}/properties/#{public_id}", @options)
  end

  private

  def initial_config
    @base_url = "https://api.stagingeb.com/v1"
    @options = {
      headers: { "X-Authorization": "l7u502p8v46ba3ppgvj5y2aad50lb9" }
    }
  end

  def pages_number
    res = HTTParty.get("#{@base_url}/properties?page=1&limit=15&search%5Bstatuses%5D%5B%5D=published", @options)
    @total_properties = res["pagination"]["total"]
    properties_per_page = res["pagination"]["limit"]
    (@total_properties * 1.0 / properties_per_page).ceil
  end
end
