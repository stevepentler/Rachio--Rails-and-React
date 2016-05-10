require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user creation upon device creation' do
    VCR.use_cassette('user_info') do
      service = RachioService.new
      user_id = "61b28ce9-7bc1-47cc-9b85-98b6bebf8951"

      assert_difference 'User.count', 1 do
        service.retrieve_devices
      end
      assert_equal user_id, User.last.user_id
    end
  end

  test 'user has devices' do
    VCR.use_cassette('user_info') do
      service = RachioService.new
      service.retrieve_devices

      user = User.last
      user_id = user.id
      device_id = "c761bfa0-4c49-4b4f-8a79-04e42bea881a"

      assert_equal 1, user.devices.count
      assert_equal device_id, user.devices.last.device_id
      assert_equal user_id, user.devices.last.user_id
    end
  end
end
