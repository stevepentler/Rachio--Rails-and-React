require 'test_helper'

class Api::V1::ZonesControllerTest < ActionController::TestCase
  test '#index' do
    user_id = "user"
    device_id = "device"
    zone_id = "zone"
    user = User.create(user_id: user_id)
    device = Device.create(user_id: user.id,
                           device_id: device_id)
    zone1 = Zone.create(zone_id: zone_id,
                        device_id: device.id,
                        name: "zone1")
    zone2 = Zone.create(zone_id: zone_id,
                        device_id: device.id,
                        name: "zone2")

    get :index, format: :json
    result = JSON.parse(response.body)

    assert_response :success
    assert_equal 200, response.status
    assert_equal 2, result.count
    assert_equal "zone1", result.first["name"]
    assert_equal device.id, result.first["device_id"]
  end

  test '#update' do
    user_id = "user"
    device_id = "device"
    zone_id = "zone"
    user = User.create(user_id: user_id)
    device = Device.create(user_id: user.id,
                           device_id: device_id)
    zone1 = Zone.create(zone_id: zone_id,
                        device_id: device.id,
                        name: "zone1")

    params = {"zoneId"=>"ad9f83be-8a6c-47ad-af40-8300557c3355", #zone4
              "zoneDuration"=>"1200" }

    put :update, format: :json, id: params["zoneId"], params: params

    assert_equal 200, response.status
  end


end