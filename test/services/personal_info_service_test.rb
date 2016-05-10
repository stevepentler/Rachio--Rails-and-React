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

      assert_equal device_id, service.retrieve_device_id
    end
  end
end