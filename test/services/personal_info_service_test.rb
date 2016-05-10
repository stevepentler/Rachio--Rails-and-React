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

  test 'retrieves user device id' do
    VCR.use_cassette('user_info') do
      service = PersonalInfoService.new
      device_id = "c761bfa0-4c49-4b4f-8a79-04e42bea881a"

      assert_equal device_id, service.retrieve_device_ids.first
    end
  end

  test 'retrieves all zones for device' do
    service = PersonalInfoService.new
    VCR.use_cassette('devise_zones') do
      zones = ["69c72b55-6418-461d-bd86-1f3eac38dbe2",
               "ad9f83be-8a6c-47ad-af40-8300557c3355",
               "18a7b4a0-0b46-4096-aefe-569d48954cef",
               "61197df9-d256-4959-8117-7625f919b2b3",
               "4f1b562e-1dc3-40d7-acf1-2a1998a47786",
               "5e78b7b7-c0c6-48e4-aab0-2504d4633564",
               "5dba747c-ad3e-450e-bf85-5061ca3bdbd5",
               "b709ec48-8b6e-44c9-937d-1c1c82376fd2"]

      assert_equal zones, service.retrieve_device_zones
    end
  end
end