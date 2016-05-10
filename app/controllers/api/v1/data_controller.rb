class DataController < ApplicationController
  def index
    capture_data = RachioService.new.store_data
    binding.pry
  end
end