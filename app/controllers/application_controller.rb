class ApplicationController < ActionController::Base
  before_action :esay_borker_obj
  
  def esay_borker_obj
    @easybroker_obj = EasyBrokerService.new
  end
end
