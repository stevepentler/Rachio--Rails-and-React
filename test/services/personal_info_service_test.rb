require 'test_helper'

class PersonalInfoServiceTest < ActiveSupport::TestCase
  test 'retrieves user id' do
    VCR.use_cassette('user_id') do
      service = PersonalInfoService.new
      assert_equal ENV['USER_ID'], service.retrieve_user_id
    end
  end

  test 'retrieves user info' do
    VCR.use_cassette('user_info') do
      service = PersonalInfoService.new
      assert_equal ENV['USER_ID'], service.retrieve_user_info["id"]
      assert_equal "rachiobeta", service.retrieve_user_info["username"]
      assert_equal "beta@rach.io", service.retrieve_user_info["email"]
    end
  end

  test 'retrieves user devices' do
    VCR.use_cassette('user_info') do
      service = PersonalInfoService.new
      first_device_id = "c761bfa0-4c49-4b4f-8a79-04e42bea881a"
      last_device_id = "c761bfa0-4c49-4b4f-8a79-04e42bea881a"

      assert_equal first_device_id, service.retrieve_device_ids.first["id"]
      assert_equal last_device_id, service.retrieve_device_ids.last["id"]
    end
  end

  test 'retrieves all zones for device' do
    service = PersonalInfoService.new
    VCR.use_cassette('device_zones') do
      first_zone_id = "4f1b562e-1dc3-40d7-acf1-2a1998a47786"
      last_zone_id = "18a7b4a0-0b46-4096-aefe-569d48954cef"

      assert_equal first_zone_id, service.retrieve_device_zones.first["id"]
      assert_equal last_zone_id, service.retrieve_device_zones.last["id"]
    end
  end
end