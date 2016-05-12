class Api::V1::DevicesController < ApplicationController
  respond_to :json
  def index
    device = User.first.devices.first
    respond_with device
  end
end