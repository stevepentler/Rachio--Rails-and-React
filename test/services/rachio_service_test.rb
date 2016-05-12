require 'test_helper'

class RachioServiceTest < ActiveSupport::TestCase
  test 'retrieves user id' do
    VCR.use_cassette('user_id') do
      service = RachioService.new
      assert_equal ENV['USER_ID'], service.retrieve_user_id
    end
  end

  test 'retrieves user info' do
    VCR.use_cassette('user_info') do
      service = RachioService.new
      assert_equal ENV['USER_ID'], service.retrieve_user_info["id"]
      assert_equal "rachiobeta", service.retrieve_user_info["username"]
      assert_equal "beta@rach.io", service.retrieve_user_info["email"]
    end
  end

  test 'retrieves user devices' do
    VCR.use_cassette('user_info') do
      service = RachioService.new
      first_device_id = "c761bfa0-4c49-4b4f-8a79-04e42bea881a"
      last_device_id = "c761bfa0-4c49-4b4f-8a79-04e42bea881a"

      assert_equal 1, service.retrieve_devices.length
      assert_equal first_device_id, service.retrieve_devices.first["id"]
      assert_equal last_device_id, service.retrieve_devices.last["id"]
    end
  end

  test 'retrieves all zones for device' do
    service = RachioService.new
    VCR.use_cassette('device_zones') do
      first_zone_id = "4f1b562e-1dc3-40d7-acf1-2a1998a47786"
      second_zone_id = "18a7b4a0-0b46-4096-aefe-569d48954cef"
      zones = service.retrieve_device_zones.map {|zone| zone["id"]}

      assert_equal 8, zones.length
      assert zones.include?(first_zone_id)
      assert zones.include?(second_zone_id)
      refute zones.include?("non-existent zone")
    end
  end

  test 'succesfully starts single zone' do
    service = RachioService.new
    VCR.use_cassette('start_zone') do
      params = {"zoneId"=>"ad9f83be-8a6c-47ad-af40-8300557c3355", #zone4
                "zoneDuration"=>"1200" }

      assert_equal 204, service.start_zone(params).status
    end
  end

  test 'formats data' do
    service = RachioService.new
    zone_id = "ad9f83be-8a6c-47ad-af40-8300557c3355"
    zone_duration = "1200"
    proper_format = "{ \"id\" : \"ad9f83be-8a6c-47ad-af40-8300557c3355\", \"duration\" : 1200 }"

    assert_equal proper_format, service.format_data(zone_id, zone_duration)
  end

end