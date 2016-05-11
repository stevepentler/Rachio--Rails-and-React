class Api::V1::ZonesController < ApplicationController
  respond_to :json
  def index
    respond_with Zone.all
  end

  def update
    service = RachioService.new
    service.start_zone(params)
    render json: "success"
  end
end