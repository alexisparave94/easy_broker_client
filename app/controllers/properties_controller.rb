class PropertiesController < ApplicationController
  before_action :initial_config

  def index
    res = HTTParty.get("#{@base_url}/properties?page=1&limit=15&search%5Bstatuses%5D%5B%5D=published", @options)
    @properties = res["content"]
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
end
