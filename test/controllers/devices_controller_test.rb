require 'test_helper'

class Api::V1::DevicesControllerTest < ActionController::TestCase

  test '#index' do
    user_id = "user"
    device_id = "device"
    user = User.create(user_id: user_id)
    device = Device.create(user_id: user.id,
                           device_id: device_id)

    get :index, format: :json
    result = JSON.parse(response.body)

    assert_response :success
    assert_equal 200, response.status
    assert_equal user.id, device.user_id
    assert_equal device_id, device.device_id
  end
end