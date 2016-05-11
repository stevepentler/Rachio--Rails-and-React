class Api::V1::DataController < ApplicationController
  respond_to :json
  def index
    respond_with RachioService.new.store_data
  end
end