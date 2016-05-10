require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  test 'retrieve device saves device to database' do
    VCR.use_cassette('user_info') do
      service = RachioService.new
      assert_difference 'Device.count', 1 do
        service.retrieve_devices
      end
      assert_equal "c761bfa0-4c49-4b4f-8a79-04e42bea881a", Device.first.device_id
    end
  end
end
