require 'test_helper'

class PersonalInfoServiceTest < ActiveSupport::TestCase
  test 'retrieves user id' do
    service = PersonalInfoService.new
    assert_equal ENV['USER_ID'], service.retrieve_user_id
  end

  test 'retrieves user info' do
    service = PersonalInfoService.new
    assert_equal ENV['USER_ID'], service.retrieve_user_info["id"]
    assert_equal "rachiobeta", service.retrieve_user_info["username"]
  end

  test 'retrieves device id' do
    device_id = "c761bfa0-4c49-4b4f-8a79-04e42bea881a"
    service = PersonalInfoService.new

    assert_equal device_id, service.retrieve_device_id
  end
end