class Api::V1::ZonesController < ApplicationController
  respond_to :json
  def index
    respond_with Zone.all
  end
end