class Api::V1::DevicesController < ApplicationController
  respond_to :json
  def index
    device_id = User.first.devices.first
    respond_with device_id
  end
end